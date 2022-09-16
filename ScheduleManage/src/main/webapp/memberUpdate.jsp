<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	<%
	String sessionId = (String) session.getAttribute("sessionId");
	%>
	
	<%@ include file = "../dbconn.jsp" %>
	

	<sql:query var="resultSet" dataSource="${dataSource}">
		select * from member where id = ?
		<sql:param value="${sessionId}"/>

	</sql:query>
	
	<c:forEach var="row" items="${resultSet.rows}">
	
	<form id="frm" action="memberUpdateProcess.jsp" method="post">
		<table>
			<tr>
				<th colspan="2">회원수정 페이지</th>
			</tr>
			<tr>
				<td>아이디:</td>
				<td><input type="text" name="id" value="<c:out value='${row.id}'/>"></td>
			</tr>
			<tr>
				<td>비밀번호:</td>
				<td><input type="password" name="passwd"></td>
			</tr>
			<tr>
				<td>이름:</td>
				<td><input type="text" name="name" value="<c:out value='${row.name}'/>"></td>
			</tr>
			<tr>
				<td>나이:</td>
				<td><input type="text" name="age" value="<c:out value='${row.age}'/>"></td>
			</tr>
			<tr>
				<td>성별:</td>
				<td>
					<c:set var="gender" value="${row.gender}"/>
					<input name="gender" type="radio" value="남" 
						<c:if test="${gender.equals('남')}"><c:out value="checked"/></c:if>
					/> 남자 
					<input name="gender" type="radio" value="여" 
						<c:if test="${gender.equals('여')}"><c:out value="checked"/></c:if>
					/> 여자
				</td>
			</tr>
			<tr>
				<td>이메일주소:</td>
				<td><input type="text" name="email" value="<c:out value='${row.email}'/>" ></td>
			</tr>
			<tr>
				<td colspan="2"><a href="javascript:frm.submit();">수정</a>&nbsp;&nbsp;&nbsp;<a href="menu.jsp">메뉴목록</a></td>
			</tr>
		</table>
	</form>
	</c:forEach>
</body>
</html>