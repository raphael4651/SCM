<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	tr, td{
		padding-right: 15px;
	}
</style>
</head>
<body>
	<h2>구구단</h2>
	<table>
			<c:forEach var="i" begin="1" end="9">
				<tr>
				<c:forEach var="j" begin="2" end="9">
					<td>${j}*${i}=${i*j}</td>
				</c:forEach>
				</tr>
			</c:forEach>
	</table>
</body>
</html>