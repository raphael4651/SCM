<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%--
		fn:split: 문자열을 특정 기호로 구분하여
		배열에 대입
	 --%>
	<c:set var="texts" 
		   value="${fn:split('Hello, Java Server Pages!',' ')}"/>
	
	<c:forEach var="i" 
			   begin="0" 
			   end="${fn:length(texts)-1}">
		<p>text[${i}] = ${texts[i]}	
	</c:forEach>
	
	<%--
		${fn:join(문자열,특수문자)}
	 --%>
	<p><c:out value="${fn:join(texts,'-')}"/>
</body>
</html>




