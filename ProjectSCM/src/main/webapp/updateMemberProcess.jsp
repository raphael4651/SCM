<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String grade = request.getParameter("grade");
	
		PreparedStatement pstmt = null;
		
		String sql = "update member set name=?, password=?, grade=?, updatedate=now() where id=?";
		
		try{
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, name);
			pstmt.setString(2, password);
			pstmt.setString(3, grade);
			pstmt.setString(4, id);
			
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
			 document.location.href="memberManagement.jsp";
		</script>
	<%		
			}catch(SQLException e){
				out.println("SQLException : " + e);
			}
		}
	%>
	
		
	
	%>
</body>
</html>