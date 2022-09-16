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
		
		String op = request.getParameter("op");
		
		/* if(op.equals("/") && num2 == 0){
			out.println("분모를 0으로 나눌수 없습니다!");
			return;
		} */
		
	 	if(op.equals("+")){
			out.println(
			 num1 + op + num2 + "=" + (num1 + num2));
		}else if(op.equals("-")){
			out.println(
			 num1 + op + num2 + "=" + (num1 - num2));
		}else if(op.equals("*")){
			out.println(
		     num1 + op + num2 + "=" + (num1 * num2));
		}else{
			
			out.println(
			 num1 + op + num2 + "=" + (num1 / num2));
		}
		
	%>
</body>
</html>







