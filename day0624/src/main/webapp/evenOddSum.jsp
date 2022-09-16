<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Scanner"%>
<%@ page import="java.text.DecimalFormat" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		//누계값을 가지는 변수 선언
		int evenSum=0,oddSum=0,totalSum=0;
	
		Scanner s = new Scanner(System.in);
	
		System.out.print("첫번째수:");
		int num1 = s.nextInt();
		System.out.print("두번째수:");
		int num2 = s.nextInt();
		
		s.close();
		
		for(int i=num1;i<=num2;i++){
			if(i%2==0){//짝수이면
				evenSum += i;
			}else{//홀수이면
				oddSum += i;
			}
			
			totalSum += i;//총합계
		}
		
		DecimalFormat df = 
		        new DecimalFormat("###,###");
		
		out.println("짝수합:"+df.format(evenSum)+"<br>");
		out.println("홀수합:"+df.format(oddSum)+"<br>");
		out.println("총합계:"+df.format(totalSum));
	
	%>
</body>
</html>





