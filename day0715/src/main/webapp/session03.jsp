<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String name;
		String value;
		
		//열거형 인터페이스
		//세션에 선언된 세션명을 모두 가져와 변수에 대입
		Enumeration en = session.getAttributeNames();
		int i = 0;
		
		//hasMoreElements() 다음에 가져올 데이터가 있는지 체크 (있으면 true)
		while(en.hasMoreElements()){
			i++;
			// userID를 가져와서 name에 대입하고
			name = en.nextElement().toString();
			// 세션에서 name(userID)의 속성값을 가져온다. 가져오는 속성값은 userPW
			value = session.getAttribute(name).toString();
			
			out.println("설정된 세션의 속성 이름 [ " + i + "] : " + name + "<br>");
			out.println("설정된 세션의 속성 값 [ " + i + "] : " + value + "<br>");
		}
	%>
</body>
</html>