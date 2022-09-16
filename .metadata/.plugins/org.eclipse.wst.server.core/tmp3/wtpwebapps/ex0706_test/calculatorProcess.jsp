<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="iot.Caculator" %>
<%@ page import="java.text.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="iot" class="iot.Caculator"/>
	
	<%
		DecimalFormat df = new DecimalFormat("###,###");
	
		int n1 = Integer.parseInt(request.getParameter("num1"));
		int n2 = Integer.parseInt(request.getParameter("num2"));
		
		int p = iot.Plus(n1, n2);
		int m = iot.Minus(n1, n2);
		double t = iot.Times(n1, n2);
		double d = iot.Divided(n1, n2);
		
		out.println(n1 + " + " + n2 + " = " + df.format(p) + "<br>");
		out.println(n1 + " - " + n2 + " = " + df.format(m) + "<br>");
		out.println(n1 + " * " + n2 + " = " + df.format(t) + "<br>");
		out.println(n1 + " / " + n2 + " = " + df.format(d) + "<br>");
	%>
</body>
</html>