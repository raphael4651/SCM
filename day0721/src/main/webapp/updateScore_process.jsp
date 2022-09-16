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
	
		int sno = Integer.parseInt(request.getParameter("sno"));
		int kor = Integer.parseInt(request.getParameter("kor"));
		int eng = Integer.parseInt(request.getParameter("eng"));
		int math = Integer.parseInt(request.getParameter("math"));
		int total = kor + eng + math;
		double avg = (double)total/3;
		String grade;
		
		if(avg >= 90){
			grade = "A";	
		}else if(avg >=80){
			grade = "B";
		}else if(avg >=70){
			grade = "C";
		}else if(avg >=60){
			grade = "D";
		}else{
			grade = "F";
		}
		
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		
		try{
			
			//입력받은 학생이 존재하는지 체크
			//없으면 count는 0을 리턴
			String sql = "select count(*) as cnt" + 
						 "  from score" + 
						 " where sno = ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, sno);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				
				int rowCount = rs.getInt("cnt");
				
				//학생번호가 테이블에 존재
				if(rowCount > 0){
					
					sql = "update score" + 
						  "   set kor = ?," +
						  "       eng = ?," + 
						  "       math = ?," + 
						  "       total = ?," +
						  "       grade = ?" + 
						  " where sno = ?";
					
					pstmt = conn.prepareStatement(sql);
					
					pstmt.setInt(1, kor);
					pstmt.setInt(2, eng);
					pstmt.setInt(3, math);
					pstmt.setInt(4, total);
					pstmt.setString(5, grade);
					pstmt.setInt(6, sno);
					
					pstmt.executeUpdate();
					
					out.println("학생정보 수정 성공");
				}else{
					out.println("해당 학생이 존재하지 않습니다.");
				}
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