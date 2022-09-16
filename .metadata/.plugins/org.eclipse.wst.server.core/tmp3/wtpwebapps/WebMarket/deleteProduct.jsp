<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
		String productId = request.getParameter("id");
	
		//삭제하려는 상품 존재 체크
		String sql = "select * from product";
		
		pstmt = conn.prepareCall(sql);
		
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			sql = "delete from product where p_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1,productId);
			
			pstmt.executeUpdate();
			
			out.println("상품 삭제 성공!");
			
		}else{
			out.println("일치하는 상품이 없습니다!");
		}
		
		if(rs != null) rs.close();
		if(conn != null) conn.close();
		if(pstmt != null) pstmt.close();
		
		response.sendRedirect("editProduct.jsp?edit=delete");
	%>
</body>
</html>



