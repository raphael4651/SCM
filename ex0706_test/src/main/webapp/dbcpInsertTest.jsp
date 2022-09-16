<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String studo = "1000";
		String name = "홍길동";
		String addr = "부산시 동래구 온천1동";
		String phone = "010-1234-5678";
	
		Connection conn = null;
		
		try{
			String url = "jdbc:mysql://localhost:3307/exam0706?serverTimezone=Asia/Seoul";
			String user = "fadmin";
			String password = "fadmin1234";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			conn = DriverManager.getConnection(url,user,password);
			
		
		}catch(SQLException e){
			out.println("DB 연결 실패");
		}
		
		PreparedStatement pstmt = null;

		String sql = "insert into student values(?,?,?,?)";
		
		try{
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, studo);
			pstmt.setString(2, name);
			pstmt.setString(3, addr);
			pstmt.setString(4, phone);
			
			pstmt.executeUpdate();
			
		}catch(SQLException e){
			out.println("DB 연결 실패1");
			
		}finally{
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
				
				out.println("자료 등록 성공");

		}
	%>
</body>
</html>