<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table {
		
		border-collapse: collapse;
		border:1px solid #000;
		width:800px;
		height:500px;
	}
	
	tr {
		border:1px solid #000;
	}
	
	td {
		border:1px solid #000;
	}
</style>
</head>
<body>
	
	<table align="center">
		<tr>
			<td>
				<jsp:include page="top.jsp"></jsp:include>
			</td>
		</tr>
		<tr>
			<td>
				<jsp:include page="content.jsp"></jsp:include>
			</td>
		</tr>
		<tr>
			<td>
				<jsp:include page="footer.jsp"></jsp:include>
			</td>
		</tr>
	</table>
	
</body>
</html>