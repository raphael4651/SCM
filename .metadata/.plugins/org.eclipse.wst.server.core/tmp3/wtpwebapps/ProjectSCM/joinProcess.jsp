<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file = "dbconn.jsp" %>
	
	<%
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String birthday = request.getParameter("birthday");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String postCd = request.getParameter("postCd");
		String address = request.getParameter("address");
		String address2 = request.getParameter("address2");
		
		PreparedStatement pstmt = null;
		
		String sql = "insert into member(id, password, name, gender, birthday, email, phone, postCd, address, address2, regdate, grade) values(?,?,?,?,?,?,?,?,?,?,now(),?)";
		
		try{
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			pstmt.setString(3, name);
			pstmt.setString(4, gender);
			pstmt.setString(5, birthday);
			pstmt.setString(6, email);
			pstmt.setString(7, phone);
			pstmt.setString(8, postCd);
			pstmt.setString(9, address);
			pstmt.setString(10, address2);
			pstmt.setString(11, "A");
			
			pstmt.executeUpdate();
			
		}catch(SQLException e){
			out.println("SQLException : " + e);
			
		}finally{
			
			try{
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
	%>
		<script>
			 alert("정상적으로 가입되었습니다!");
			 document.location.href="login.jsp";
		</script>
	<%		
			}catch(SQLException e){
				out.println("SQLException : " + e);
			}
		}
		
	%>
</body>
</html>