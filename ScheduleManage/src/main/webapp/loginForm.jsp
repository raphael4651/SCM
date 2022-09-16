<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table{
		border: 1px solid #000;
	}
	
	tr, th, td{
		text-align: center;
		margin: 5px;
		padding: 5px;
	}
	
</style>
</head>
<body>
	<form id="frm" action="loginProcess.jsp" method="post">
		<table>
			<tr>
				<th colspan="2">로그인 페이지</th>
			</tr>
			<tr>
				<td>아이디:</td>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<td>비밀번호:</td>
				<td><input type="password" name="passwd"></td>
			</tr>
			<tr>
				<td colspan="2"><a href="javascript:frm.submit();">로그인</a> &nbsp;&nbsp;<a href="joinForm.jsp">회원가입</a></td>
			</tr>
		</table>
	</form>
</body>
</html>
