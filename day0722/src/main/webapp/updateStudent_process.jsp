<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="dbconn.jsp" %>
		
	<%
		String num = request.getParameter("num");
		String depart = request.getParameter("depart");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");

		PreparedStatement pstmt = null;
		
		try{
			
			String sql = "update student" +
			             "   set depart=?," +
						 "       address=?," +
			             "       phone=?" +
						 " where num = ?";
				
			pstmt = conn.prepareStatement(sql);
			
			
			pstmt.setString(1,depart);
			pstmt.setString(2,address);
			pstmt.setString(3,phone);
			pstmt.setString(4,num);
			
			pstmt.executeUpdate();
			
			out.println("<script>");
			out.println("alert('정상적으로 데이터 수정')");
			out.println("</script>");
		
		}catch(SQLException e){
			out.println("<script>");
			out.println("alert('데이터 수정 실패')");
			out.println("</script>");
		}finally{
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	%>
</body>
</html>