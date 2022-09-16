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
	<%-- <p> 아이디 : <%=person.getId() %>
	<p> 이 름 : <%=person.getName() %> --%>
	
	<%-- property 에는 클래스 필드 명을 선언 --%>
	<p> 아이디 : <jsp:getProperty name="person" property="id"/>
	<p> 이 름 : <jsp:getProperty name="person" property="name" />
</body>
</html>