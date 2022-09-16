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
	<!-- javaBeans 사용으로 현재 날짜(Date)를 가져온다-->
	<p> <jsp:useBean id="now" class="java.util.Date"/>
	<!-- type="date" 현재 날짜 출력 -->
	<p> <fmt:formatDate value="${now}" type="date"/>
	<!-- type="time" 현재 시간 출력 -->
	<p> <fmt:formatDate value="${now}" type="time"/>
	<!-- type="both" 현재 날짜, 시간 출력 -->
	<p> <fmt:formatDate value="${now}" type="both"/>
	<p> <fmt:formatDate value="${now}" type="both" dateStyle="default" timeStyle="default"/>
	<p> <fmt:formatDate value="${now}" type="both" dateStyle="short" timeStyle="short"/>
	<p> <fmt:formatDate value="${now}" type="both" dateStyle="medium" timeStyle="medium"/>
	<p> <fmt:formatDate value="${now}" type="both" dateStyle="long" timeStyle="long"/>
	<p> <fmt:formatDate value="${now}" type="both" dateStyle="full" timeStyle="full"/>
	<p> <fmt:formatDate value="${now}" type="both" pattern="yyyy년MM월dd일 HH시mm분ss초 E요일"/>
</body>
</html>