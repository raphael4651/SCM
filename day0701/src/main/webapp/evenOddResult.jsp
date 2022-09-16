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
		int num1 = Integer.parseInt(request.getParameter("num1"));
		int num2 = Integer.parseInt(request.getParameter("num2"));
		
		int evenSum=0,oddSum=0,totalSum=0;
		
		for(int i=num1;i<=num2;i++){
			if(i % 2 == 0){//짝수
				evenSum += i;
			}else{//홀수
				oddSum += i;
			}
			
			totalSum += i;//총합계
		}
		
		out.println("짝수합:" + evenSum+"<br>");
		out.println("홀수합:" + oddSum+"<br>");
		out.println("총합계:" + totalSum);
	%>
</body>
</html>






