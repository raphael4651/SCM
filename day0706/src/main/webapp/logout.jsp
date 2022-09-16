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
		//session 정보를 모두 삭제
		session.invalidate();
		response.sendRedirect("main.jsp");
	%>
</body>
</html>





