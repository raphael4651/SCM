<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 현재 jsp 페이지가 오류를 처리하는 페이지인지 여부 --%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h2>분모는 0으로 나눌 수 없습니다!</h2>
	
	<%
		out.println("예외클래스: " + exception.getClass().getName() + "<br>");
		out.println("예외내용: " + exception.getMessage());
	%>
	
</body>
</html>