<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="exception_error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		/* getParameter는 문자열을 가져온다 */
		String num1 = request.getParameter("num1");
		String num2 = request.getParameter("num2");
		/* 문자열을 int type으로 변환 */
		int a = Integer.parseInt(num1);
		int b = Integer.parseInt(num2);
		int c = a/b;
		out.print(num1 + " / " + num2 + " = " + c);
	%>
</body>
</html>