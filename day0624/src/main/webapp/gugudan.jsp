<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body {
		font-family:consolas;
	}
</style>
</head>
<body>
	<%
	
		//printf를 사용하기 위해 선언
		PrintWriter out2 = response.getWriter();
	
		for(int i=1;i<=9;i++){
			for(int j=2;j<=9;j++){
				out2.printf("%d*%d=%2d&nbsp&nbsp",
			           	    j,i,j*i);
			}
			
			//다음줄로 내려간다.
			out2.println("<br>");
		}
	
	%>
</body>
</html>

