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
	
	<%
	String sessionId = (String) session.getAttribute("sessionId");
	%>
	
	<%@ include file="../dbconn.jsp" %>
	

	<sql:update dataSource="${dataSource}">
		insert into schedule(sdate,title,content,location,regdate) values(?,?,?,?,now())
		<sql:param value="${param.sdate}"/>
		<sql:param value="${param.title}"/>
		<sql:param value="${param.content}"/>
		<sql:param value="${param.location}"/>
	</sql:update>
	
	 <script>
		 alert("정상적으로 저장되었습니다!");
		 document.location.href="scheduleList.jsp";
	 </script>
</body>
</html>