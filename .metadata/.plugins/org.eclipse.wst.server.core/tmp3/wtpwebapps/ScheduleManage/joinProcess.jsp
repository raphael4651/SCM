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

	<%@ include file="../dbconn.jsp" %>
	

	<sql:update dataSource="${dataSource}">
		insert into member(id,password,name,age,gender,email,regdate) values(?,?,?,?,?,?,now())
		<sql:param value="${param.id}"/>
		<sql:param value="${param.passwd}"/>
		<sql:param value="${param.name}"/>
		<sql:param value="${param.age}"/>
		<sql:param value="${param.gender}"/>
		<sql:param value="${param.email}"/>

	</sql:update>
	
	<script>
		 alert("정상적으로 저장되었습니다!");
		 document.location.href="menu.jsp";
	 </script>
</body>
</html>