<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>스케줄 등록</title>
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
	<form id="frm" action="scheduleProcess.jsp" method="post">
		<table>
			<tr>
				<th colspan="2">스케줄등록 페이지</th>
			</tr>
			<tr>
				<td>회의일자:</td>
				<td><input type="text" name="sdate"></td>
			</tr>
			<tr>
				<td>제목:</td>
				<td><input type="text" name="title"></td>
			</tr>
			<tr>
				<td>내용:</td>
				<td><input type="text" name="content"></td>
			</tr>
			<tr>
				<td>장소:</td>
				<td><input type="text" name="location"></td>
			</tr>
			<tr>
				<td colspan="2"><a href="javascript:frm.submit();">등록</a>&nbsp;&nbsp;&nbsp;<a href="#">다시작성</a></td>
			</tr>
		</table>
	</form>
</body>
</html>