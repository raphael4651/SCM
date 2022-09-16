<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		DecimalFormat df = new DecimalFormat("###,###");
	
		int num1 = Integer.parseInt(request.getParameter("num1"));
		int num2 = Integer.parseInt(request.getParameter("num2"));
	
		int evenSum = 0, oddSum = 0, totalSum = 0;
		
		for(int i=num1; i<=num2; i++){
			if(i%2 == 0){
				evenSum += i;
			}else{
				oddSum += i;
			}
			
			totalSum += i;
		}
	%>
	<p>짝수합:<%=df.format(evenSum) %>
	<p>홀수합:<%=df.format(oddSum) %>
	<p>총합계:<%=df.format(totalSum) %>
</body>
</html>