<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Enumeration" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		//반복
		//request.getHeaderNames();
		//헤더정보를 가져온다.
		Enumeration en = request.getHeaderNames();
		
		//hasMoreElements?
		//다음 헤더 정보를 가져올게 있느냐 체크		
		while(en.hasMoreElements()){
			//헤더이름
			String headerName = (String)en.nextElement();
			//헤더 값
			String headerValue = 
					request.getHeader(headerName);
	%>
	
	<%=headerName%> : <%=headerValue%><br>

	<%
		}
	%>	
</body>
</html>




