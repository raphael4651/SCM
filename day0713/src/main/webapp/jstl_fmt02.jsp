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
	<p> 숫자 : <fmt:formatNumber value="3200100"/>
	<!-- 천단위 콤마 표시 -->
	<p> <fmt:formatNumber value="3200100" type="number"/>
	<p> <fmt:formatNumber value="3200100" type="number" groupingUsed="false"/>
	<!-- currency : 현재 국가 통화 기호 
		 groupingUsed="true" : 천단위 콤마 표시	-->
	<p> <fmt:formatNumber value="3200100" type="currency" groupingUsed="true"/>
	<!-- currencySymbol은 맨 앞에 표시하는 기호 선언 -->
	<p> <fmt:formatNumber value="3200100" type="currency" currencySymbol="&"/>
	<!-- 숫자를 %로 표기 -->
	<p> <fmt:formatNumber value="0.45" type="percent"/>
	<!-- minIntegerDigits="10": 숫자를 10자리로 출력  
		 minFractionDigits="2": 소수점을 2자리까지 출력 -->
	<p> <fmt:formatNumber value="3200100" minIntegerDigits="10" minFractionDigits="2"/>
	<!-- pattern은 원하는 형태로 출력 -->
	<p> <fmt:formatNumber value="3200100.45" pattern=".000"/>
	<!-- value는 .456인데 pattern으로 소수점 두자리까지 표시하므로 사사오입해서 두자리까지 출력 -->
	<p> <fmt:formatNumber value="3200100.456" pattern="#,#00.0#"/>
</body>
</html>