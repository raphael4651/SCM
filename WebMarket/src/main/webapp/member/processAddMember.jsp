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
	<%-- jstl을 이용한 데이터베이스 연결 --%>
	<%@ include file="../dbconn2.jsp" %>
	
	<%-- 
		param 객체를 사용하여 입력 폼 값을 가져온다 
	 --%>
	<sql:update dataSource="${dataSource}">
		insert into member
		     values(?,?,?,?,?,?,?,?,?,?,now())
		<sql:param value="${param.id}"/>
		<sql:param value="${param.password}"/>
		<sql:param value="${param.name}"/>
		<sql:param value="${param.gender}"/>
		<sql:param value="${param.birthday}"/>
		<sql:param value="${param.mail}"/>
		<sql:param value="${param.phone}"/>
		<sql:param value="${param.postCd}"/>
		<sql:param value="${param.address}"/>
		<sql:param value="${param.address2}"/>			     	
	</sql:update>
	
	<%-- 특정 jsp 이동 
		resultMember.jsp? 어떤 작업을 한 후에
		결과를 보여주기 위한 jsp
	--%>
	<c:redirect url="resultMember.jsp?gubun=insert"/>
</body>
</html>




