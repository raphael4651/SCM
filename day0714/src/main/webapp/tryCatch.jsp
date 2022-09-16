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
	
		try{
			
			int a=10,b=0,c;
			
			c=a/b;
			
			out.println(c);
			
		}catch(ArithmeticException e){
			out.println("오류발생:" + e.getMessage());
		}catch(NumberFormatException e){
			out.println("오류발생:" + e.getMessage());
		}catch(Exception e){
			out.println("오류발생:" + e.getMessage());
		}
	
		
	%>
</body>
</html>








