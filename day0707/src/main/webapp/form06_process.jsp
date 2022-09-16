<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr>
			<th>요청 파라미터 이름</th>
			<th>요청 파라미터 값</th>
		</tr>
		
		<%
			request.setCharacterEncoding("utf-8");
			
			//Enumeration(열거형 인터페이스)
			//getParameterNames() 
			//입력 폼에서 name 속성으로 지정된 이름을 모두 가져와서 변수에 대입
			Enumeration paramNames = request.getParameterNames();
			
			
			//hasMoreElements() 다음에 가져올 데이터가 있는지 체크
			while (paramNames.hasMoreElements()){
				
				//nextElement() 다음 데이터를 가져온다
				//paramNames에 열거형으로 들어있는 name 속성
				String name = (String)paramNames.nextElement();
				out.println("<tr><td>" + name + "</td>\n");
				
				//입력 폼에서 입력한 실제 값을 가져온다.
				String paramValue = request.getParameter(name);
				out.println("<td>" + paramValue + "</td></tr>\n");
				// \n : escape문자
			}
		%>
	</table>
</body>
</html>