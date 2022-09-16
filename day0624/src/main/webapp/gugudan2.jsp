<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body{
		font-family : consolas;
		font-size : 20px;
	}
</style>
</head>
<body>
<%
	for(int i=1;i<=9;i++){
		for(int j=2;j<=9;j++){
			out.print(j+"*"+i+"="+j*i+"<br>");
		}
		out.print("<br>");
	}

%>
</body>
</html>