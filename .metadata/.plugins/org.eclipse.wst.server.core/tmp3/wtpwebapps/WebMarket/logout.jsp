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
		//세션으로 지정된 속성값을 모두 삭제
		session.invalidate();
		//강제로 이동
		response.sendRedirect("addProduct.jsp");
	%>
</body>
</html>



