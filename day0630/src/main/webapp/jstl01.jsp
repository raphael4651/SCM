<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 국가별 통화, 날짜 표기 --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- 데이터베이스 연동 설정 --%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- <c:set> var(변수) 선언 --%>
	<c:set var="name" value="홍길동" scope="page"/>
	<%-- 변수이름 "name" 값"홍길동" scope(유효범위) "page"(현재page까지 유효) --%>
	<%-- scope="request" server가 응답처리 할 때까지 유효 --%>
	<%-- scope="session" 같은 브라우저 내에서만 유효 --%>
	<%-- scope="application" 프로그램이 실행되고 있는 동안 유효 --%>
	
	<%-- <c:out> 화면에 출력 --%>
	<h2><c:out value="${name}"/></h2>
	
	<c:set var="num1" value="10"/>
	<c:set var="num2" value="20"/>
	
	<h2>합계:${num1 + num2}</h2>	
	
	<c:set var="num" value="11"/>
	<c:if test="${num % 2 == 0}">
		<h2>${num}은 짝수</h2>
	</c:if>
	<c:if test="${num % 2 == 1}">
		<h2>${num}은 홀수</h2>
	</c:if>
	
	<%-- <c:if> 에서 test=" " 사이에 조건식을 el로 넣는다.
		${조건식}
	 --%>
	
</body>
</html>