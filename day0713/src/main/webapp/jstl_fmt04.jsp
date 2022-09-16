<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="now" class="java.util.Date"/>
	<p> 한국 : <fmt:formatDate value="${now}" type="both" dateStyle="full" timeStyle="full"/>
	<%--<fmt:timeZone value="타임존"  타임존 자리에 timeZoneList를 보고 넣으면 된다.--%>
	<p> <fmt:timeZone value="America/New_York">
			뉴욕 : <fmt:formatDate value="${now}" type="both" dateStyle="full" timeStyle="full"/>
		</fmt:timeZone>
	<p> <fmt:timeZone value="Europe/London">
			런던 : <fmt:formatDate value="${now}" type="both" dateStyle="full" timeStyle="full"/>
		</fmt:timeZone>
</body>
</html>