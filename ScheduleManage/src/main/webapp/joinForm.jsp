<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>회원 가입</title>
<style>
	
	table{
		border: 1px solid #000;
		width: 450px;
	}
	
	th, tr, td{
		padding: 10px;
		border: 1px solid #000;
		text-align: center;
	}
</style>
</head>
<body>
	<form id="frm" action="joinProcess.jsp" method="post">
		<table>
			<tr>
				<th colspan="2">회원가입 페이지</th>
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
				<td>이름:</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>나이:</td>
				<td><input type="text" name="age"></td>
			</tr>
			<tr>
				<td>성별:</td>
				<td>
					<input name="gender" type="radio" value="남" /> 남자
					<input name="gender" type="radio" value="여" /> 여자
				</td>
			</tr>
			<tr>
				<td>이메일주소:</td>
				<td><input type="text" name="email"></td>
			</tr>
			<tr>
				<td colspan="2"><a href="javascript:frm.submit();">회원가입</a>&nbsp;&nbsp;&nbsp;<a href="#">다시작성</a></td>
			</tr>
		</table>
	</form>
</body>
</html>