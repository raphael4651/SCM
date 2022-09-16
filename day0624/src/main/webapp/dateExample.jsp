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
		//현재일시를 가져오는 클래스
		Date now = new Date();
	   
	    //날짜를 원하는 형태로 변환
	    SimpleDateFormat f = 
	        new SimpleDateFormat("yyyy년 MM월 dd일 HH시mm분ss초 E요일");
	
	    String today = f.format(now);
	    
	    out.print("오늘 날짜:" + today);
	%>
</body>
</html>







