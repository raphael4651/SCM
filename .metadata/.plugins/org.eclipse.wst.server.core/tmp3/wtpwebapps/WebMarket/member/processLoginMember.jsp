<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
	
	<sql:query var="resultSet"
	           dataSource="${dataSource}">
		select *
		  from member
		 where id = ? and password = ?
		<sql:param value="${param.id}"/>
		<sql:param value="${param.password}"/>  	
	</sql:query>
	
	<%-- 로그인한 아이디와 비밀번호에 대한 정보가
	     테이블에 존재하는 경우 해당 아이디를
	     session 속성으로 지정
	 --%>
	<c:if test="${resultSet.rowCount > 0}">
		<c:set var="sessionId"
		       value="${param.id}"
		       scope="session"/>
		<c:redirect url="resultMember.jsp?gubun=login"/>       
	</c:if>
	
	<%-- 로그인 실패시 --%>
	<c:if test="${resultSet.rowCount == 0}">
		<c:redirect url="resultMember.jsp?gubun=loginError"/>
	</c:if>
</body>
</html>






