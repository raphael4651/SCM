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
		String id = (String) session.getAttribute("userID");
		
		if(id == null){
			response.sendRedirect("session_out.jsp");
		}
	%>
	
	<h3><%=id%>님 반갑습니다.</h3>
	<a href="session_out.jsp">로그아웃</a>
</body>
</html>