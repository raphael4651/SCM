<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>    
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		
		String productId = request.getParameter("productId");
		String pname = request.getParameter("pname");
		String type = request.getParameter("type");
		int unitPrice = Integer.parseInt(request.getParameter("unitPrice"));
		String description = request.getParameter("description");
		String manufacturer = request.getParameter("manufacturer");
		String category = request.getParameter("category");
		Long unitsInStock = Long.parseLong(request.getParameter("unitsInStock"));	
		
		PreparedStatement pstmt = null;
		
		String sql = "update product set productId=?, pname=?, type=?, category=?, manufacturer=?, unitPrice=?, description=?, unitsInStock=?, updateDate=now() where productId=?";
		
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, productId);
		pstmt.setString(2, pname);
		pstmt.setString(3, type);
		pstmt.setString(4, category);
		pstmt.setString(5, manufacturer);
		pstmt.setInt(6, unitPrice);
		pstmt.setString(7, description);
		pstmt.setLong(8, unitsInStock);
		pstmt.setString(9, productId);
		
		pstmt.executeUpdate();
		
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
		
		response.sendRedirect("products.jsp");
	%>
</body>
</html>



