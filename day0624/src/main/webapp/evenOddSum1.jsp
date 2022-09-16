<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Scanner" %>
<%@ page import="java.text.DecimalFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
	
	int even_sum = 0;
	int odd_sum = 0;
	int total_sum = 0;

	Scanner s = new Scanner(System.in);
	
	System.out.print("첫번째 수:");
	int num1 = s.nextInt();
	System.out.print("두번째 수:");
	int num2 = s.nextInt();
	
	s.close();
	
	for(int i=num1; i<=num2; i++){
		if(i%2 == 0){
			even_sum += i;
		}else{
			odd_sum += i;
		};
		
		total_sum += i;
	}
	
	DecimalFormat df = new DecimalFormat("###,###");
	
	System.out.print("짝수합:"+df.format(even_sum)+"<br>");
	System.out.print("홀수합:"+df.format(odd_sum)+"<br>");
	System.out.print("총합계:"+df.format(total_sum));
	
	
	%>
</body>
</html>