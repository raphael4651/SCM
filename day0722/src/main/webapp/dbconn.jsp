<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		//데이터베이스 연결을 위한 객체 선언
		Connection conn = null;
			
		//데이터베이스 연결 정보
		String url = "jdbc:mysql://localhost:3307/exercisedb?serverTimezone=Asia/Seoul";
		String user = "jsp";//사용자아이디
		String password = "jsp1234";//비밀번호
		
		//mysql jar파일을 로딩
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		//데이터베이스 연결 시도
			conn = DriverManager.getConnection(url,user,password);

	%>		
</body>
</html>




