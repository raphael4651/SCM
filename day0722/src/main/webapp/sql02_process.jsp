<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		String name = request.getParameter("name");
	%>
	
	<sql:setDataSource
		var="dataSource"
		url="jdbc:mysql://localhost:3307/exercisedb?serverTimezone=Asia/Seoul"
		driver="com.mysql.cj.jdbc.Driver"
		user="jsp"
		password="jsp1234"/>
		
	<%--
		sql:update?
		insert,delete,update문을 실행시 선언
	 --%>	
	<sql:update dataSource="${dataSource}" 
	            var="resultSet">
		insert into member values(?,?,?)
		<%-- ?에 매개변수를 대입 --%>
		<sql:param value="<%=id%>"/>
		<sql:param value="<%=passwd%>"/>
		<sql:param value="<%=name%>"/>
	</sql:update>
	
	<%-- insert후에 리스트로 이동 --%>
	<c:import var="url" url="sql01.jsp"/>
	
	${url}	
</body>
</html>


