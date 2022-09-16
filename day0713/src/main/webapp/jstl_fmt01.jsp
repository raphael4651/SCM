<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- fmt 통화, 시간, 날짜  -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<fmt:setLocale value='<%=request.getParameter("language") %>'/>
	
	<!-- a태그를 이용하여 한국어를 클릭하면 매개변수로 ko를 전달하고
		영어를 클릭하면 en을 전달 -->
	<fmt:bundle basename="bundle.myBundle">
		<a href="?language=ko">한국어</a>|
		<a href="?language=en">영어</a>
		
		<form action="#" method="post">
			<p><fmt:message key="id"/>:<input type="text" name="id">
			<p><fmt:message key="password"/>:<input type="password" name="passwd">
			<p><input type="submit" value="<fmt:message key="button"/>"/>
		</form>
	</fmt:bundle>  
</body>
</html>