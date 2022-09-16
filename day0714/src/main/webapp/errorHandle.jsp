<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>오류 발생</h3>
	<table border="1">
		<tr>
			<td><b>Error:</b></td>
			<td><%=exception.toString()%></td>
		</tr>
		<tr>
			<td><b>URI:</b></td>
			<td><%=request.getRequestURI()%></td>
		</tr>
		<tr>
			<td><b>Status Code:</b></td>
			<td><%=response.getStatus()%></td>
		</tr>
	</table>
</body>
</html>









