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

	<%@ include file = "dbconn2.jsp" %>
	
	<%
		String sdate = request.getParameter("sdate");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String location = request.getParameter("location");
		
		PreparedStatement pstmt = null;
		
		String sql = "update schedule set sdate=?, title=?, content=?, location=?, updatedate=curdate() where sdate= ?"; 
		
		try{
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, sdate);
			pstmt.setString(2, title);
			pstmt.setString(3, content);
			pstmt.setString(4, location);
			pstmt.setString(5, sdate);
			
			pstmt.executeUpdate();
		
		}catch(SQLException e){
			out.println("SQLException : " + e);
		
		}finally{
    		
			try{
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			
	%> 
		<script>
			 alert("정상적으로 수정되었습니다!");
			 document.location.href="scheduleList.jsp";
		</script>
	<%		
			}catch(SQLException e){
				out.println("SQLException : " + e);
			}
		}
	%>
	
	
	
</body>
</html>