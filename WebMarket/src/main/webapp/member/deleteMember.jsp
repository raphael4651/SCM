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
	<%@ include file="../menu.jsp"%>
	
	<%@ include file="../dbconn2.jsp"%>

	<sql:update 
			dataSource="${dataSource}"
			var="resultSet">
		delete from member
		      where id = ?
		<sql:param value="${sessionId}"/>      
	</sql:update>
	
	<%
		//회원정보가 삭제되므로 세션에 있는 모든 값 삭제
		session.invalidate();
	%>
	
	<c:redirect 
		url="resultMember.jsp?gubun=delete"/>
</body>
</html>