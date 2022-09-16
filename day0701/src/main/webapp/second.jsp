<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 
		request : 내장객체
		getParameter : 이전 jsp페이지에서 전달한 속성값을 가져온다.
	 -->
	Today is : <%=request.getParameter("date") %>
</body>
</html>