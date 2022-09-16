<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../dbconn2.jsp"%>
	
	<sql:update
	        var="resultSet" 
			dataSource="${dataSource}">
		
		update member
		   set passwd = ?,
		       name = ?,
		       gender = ?,
		       birth = ?,
		       mail = ?,
		       phone = ?,
		       postCd = ?,
		       address = ?,
		       address2 = ?,
		       regDate = now()
		 where id = ?       
		<sql:param value="${param.password}"/>
		<sql:param value="${param.name}"/>
		<sql:param value="${param.gender}"/>
		<sql:param value="${param.birthday}"/>
		<sql:param value="${param.mail}"/>
		<sql:param value="${param.phone}"/>
		<sql:param value="${param.postCd}"/>
		<sql:param value="${param.address}"/>
		<sql:param value="${param.address2}"/>
		<sql:param value="${param.id}"/>						
	</sql:update>
	
	<c:redirect url="resultMember.jsp?gubun=update"/>
</body>
</html>