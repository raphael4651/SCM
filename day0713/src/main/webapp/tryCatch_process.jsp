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
			String num1 = request.getParameter("num1");
			String num2 = request.getParameter("num2");
			int a = Integer.parseInt(num1);
			int b = Integer.parseInt(num2);
			int c = a/b;
			out.println(a + " / " + b + " = " + c);
		
		
		}catch(ArithmeticException e){
			RequestDispatcher dispatcher 
			= request.getRequestDispatcher("tryCatch_error2.jsp");
			dispatcher.forward(request, response);
			
		}catch(NumberFormatException e){
			RequestDispatcher dispatcher 
			= request.getRequestDispatcher("tryCatch_error.jsp");
			dispatcher.forward(request, response);
		}catch(Exception e){
			e.printStackTrace();
		}
		/* Exception은 오류예외의 최고 조상이므로 가장 밑에 적어야 하며
			다른 예외처리를 순서대로 찾은 뒤에 없을 때 작동한다
		*/
	%>
</body>
</html>