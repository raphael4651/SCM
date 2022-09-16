<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Scanner" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- declaration tag --%>
	<%!
		int total;
	
		public int add(int num1,int num2){
			
			for(int i=num1;i<=num2;i++){
				total += i;
			}
			
			return total;
		}
	%>
	
	<%-- 스크립틀릿 tag --%>
	<%
		Scanner s = new Scanner(System.in);
		
		System.out.print("첫번째 수:");
		int num1 = s.nextInt();
		System.out.print("두번째 수:");
		int num2 = s.nextInt();
		
	%>

	<p><%=num1%>부터<%=num2%>까지 합계:<%=add(num1,num2)%>
		
</body>
</html>