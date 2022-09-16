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
	<%@ include file = "dbconn.jsp" %>
	
	<%
		request.setCharacterEncoding("utf-8");
	
		String sno = request.getParameter("sno");
		
		ResultSet rs = null;
		
		PreparedStatement pstmt = null;
		
		try{
			String sql = "select count(*) as cnt" +
						 "  from score" + 
						 " where sno = ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, sno);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				
				int rowCount = rs.getInt("cnt");
				
				if(rowCount > 0){
					
					sql = "delete from score" + 
						  "      where sno = ?";
					
					pstmt = conn.prepareStatement(sql);
					
					pstmt.setString(1, sno);
					
					pstmt.executeUpdate();
					
					out.println("학생 정보 삭제 성공");
				}else{
					out.println("학생 번호가 맞지 않습니다.");
				}
			}else{
				out.println("score 테이블에 학생 정보가 없습니다.");
			}
			
		}catch(SQLException e){
				out.println("SQLException : " + e.getMessage());
				
		}finally{
			if(rs != null){
				rs.close();
			}
			if(pstmt != null){
				pstmt.close();
			}
			if(conn != null){
				conn.close();
			}
		}
	%>
</body>
</html>