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
	
		//화면에서 입력받은 값을 가져온다.
		String id = request.getParameter("id");
		String pw = request.getParameter("passwd");
		String name = request.getParameter("name");
		
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		
		try{
			String sql = "select id, passwd" + 
						 "  from member" +
						 " where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			//select문 실행시 사용
			rs = pstmt.executeQuery();
					
			//next()로 한행을 가져온다
			//if(rs.next())가 true라면 입력받은 id값이 테이블에 존재한다.
			if(rs.next()){
				
				//테이블에 있는 id와 비밀번호를 가져온다.
				String rId = rs.getString("id");
				String rPasswd = rs.getString("passwd");
				
				//if문이 true라면 비밀번호가 table에 존재한다.
				if(id.equals(rId) && pw.equals(rPasswd)){
					sql = "update member" + 
						  "   set name = ?" +
						  " where id = ?";
					
					pstmt = conn.prepareStatement(sql);
					
					pstmt.setString(1, name);
					pstmt.setString(2, id);
					
					pstmt.executeUpdate();
					
					out.println("테이블을 수정했습니다.");
					
				}else{
					out.println("비밀번호가 일치하지 않습니다.");
				}
				
			//if(rs.next())가 else라면 입력받은 id값이 테이블에 존재하지않는다.
			}else{
				out.println("member 테이블에 일치하는 아이디가 없습니다.");
			}
			
		}catch(SQLException e){
			out.println("member 테이블 접근 실패<br>");
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