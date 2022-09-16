<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="person" class="beans.Person" scope="request"/>
	<p> 아이디 : <%=person.getId() %>
	<p> 이 름 : <%=person.getName() %>
	
	<%--<%
		//id와 name 필드에 값을 set(대입)	
		person.setId(20182005);
		person.setName("홍길동");
	%>--%>
	
	<jsp:setProperty name="person" property="id" value="20182005"/>
	<jsp:setProperty name="person" property="name" value="홍길순"/>
	
	<jsp:include page="useBean03.jsp"/>
	
</body>
</html>