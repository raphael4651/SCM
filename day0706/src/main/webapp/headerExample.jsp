<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Date now = new Date();
	
		SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일 hh시 mm분 ss초 E요일");
	
		String today = sf.format(now);
		
		out.println("현재시간: " + today);
		
		//헤더정보를 수정하여 현재시간을 자동으로 표시
		//Refresh 속성은 새로고침 속성
		response.setHeader("Refresh", "1;URL=http://localhost:8080/day0706/headerExample.jsp");
		// 1초마다 URL을 실행
	%>
</body>
</html>