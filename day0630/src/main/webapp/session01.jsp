<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import = "java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 스크립틀릿 태그(자바소스) --%>
	<%
		//현재 날짜
		Date t = new Date();
		//날짜를 원하는 문자열 형태로 출력
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	%>
	
	<%-- 톰캣서버가 부여하는 session id --%>
	session id:<%=session.getId() %> <br>
	
	session 생성시간:<%=sf.format(t) %> <br>
	
	<%
		//session을 마지막으로 접근한 시간
		t.setTime(session.getLastAccessedTime());
	%>
	
	최근 접근시간:<%=sf.format(t) %>
</body>
</html>