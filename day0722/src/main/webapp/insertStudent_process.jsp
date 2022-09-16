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
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");

		PreparedStatement pstmt = null;
		
		try{
			
			String sql = "insert into student" +
			             "     values(?,?,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1,num);
			pstmt.setString(2,depart);
			pstmt.setString(3,name);
			pstmt.setString(4,address);
			pstmt.setString(5,phone);
			
			pstmt.executeUpdate();
			
			out.println("<script>");
			out.println("alert('정상적으로 데이터 추가')");
			out.println("</script>");
		
		}catch(SQLException e){
			out.println("<script>");
			out.println("alert('데이터 추가 실패')");
			out.println("</script>");
		}finally{
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	%>
</body>
</html>