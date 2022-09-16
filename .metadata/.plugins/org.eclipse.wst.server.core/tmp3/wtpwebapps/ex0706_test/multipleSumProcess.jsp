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
		request.setCharacterEncoding("utf-8");
	
		int n1 = Integer.parseInt(request.getParameter("num1"));
		int n2 = Integer.parseInt(request.getParameter("num2"));
		
		int fiveSum = 0;
		
		for(int i=n1; i<=n2; i++){
			if(i%5 == 0){
				fiveSum += i;
			}
		}
		
		out.println(n1 + " 부터 " + n2 + " 까지 5의 배수의 합계: " + fiveSum);
	%>
</body>
</html>