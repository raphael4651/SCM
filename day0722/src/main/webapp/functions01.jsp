<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>java 문자열 검색
	
	<%-- 문자열에 특정 문자가 있는지 검색 --%>
	<p>Hello,Java Server Pages! =>
	   ${fn:contains("Hello,Java Server Pages!","java")}
	
	<p>hello,java server pages! =>
	   ${fn:containsIgnoreCase("hello,Java server pages!","java")}	   
</body>
</html>






