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
		String productId = request.getParameter("productId");
		
		PreparedStatement pstmt = null;
		
		String sql = "delete from product where productId = ?";
		
		try{
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, productId);
			
			pstmt.executeUpdate();
			
		}catch(SQLException e){
			out.println("SQLException : " + e);
			
		}finally{
			
			try{
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
				
				session.invalidate();
	%>
		<script>
			 alert("정상적으로 삭제되었습니다!");
			 document.location.href="products.jsp";
		</script>
	<%		
			}catch(SQLException e){
				out.println("SQLException : " + e);
			}
		}
		
	%>
</body>
</html>