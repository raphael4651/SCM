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
	
	<%@ include file = "../dbconn2.jsp" %>
	
	<%
		PreparedStatement pstmt = null;
	
		String sdate = request.getParameter("sdate");
		
		try{
			String sql = "delete from schedule where sdate=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, sdate);
			
			pstmt.executeUpdate();
			
		}catch(SQLException e){
			out.println("SQLException : " + e);
			
		}finally{
			if(pstmt != null) pstmt.close();
			if(conn != null) pstmt.close();
	%>
		<script>
		 alert("정상적으로 삭제되었습니다!");
		 document.location.href="scheduleList.jsp";
	 	</script>
	<%
			
		}
	
	%>

</body>
</html>