<%@page import="beans.Calculator"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- JavaBeans 사용 선언 --%>
	<jsp:useBean id="bean" class="beans.Calculator"/>
	<%
		int m = bean.Process(5);
		out.print("5의 세제곱 : " + m);
	%>
</body>
</html>