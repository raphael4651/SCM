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
		String sessionId = (String) session.getAttribute("sessionId");
		
		PreparedStatement pstmt = null;
		
		String sql = "delete from member where id = ?";
		
		try{
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, sessionId);
			
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
			 alert("정상적으로 탈퇴되었습니다!");
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