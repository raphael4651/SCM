<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Database SQL</title>
</head>
<body>
	<%@ include file = "dbconn.jsp" %>
	<%
		request.setCharacterEncoding("UTF-8");
	
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		String name = request.getParameter("name");
		
		PreparedStatement pstmt = null;
		
		try{
			String sql = 
					"insert into member(id, passwd, name) values(?,?,?)";
			
			/* 
				"insert into member(id, passwd, name)" + 
				" values(?,?,?)"
				sql문을 두줄로 작성시 "내용" + " 내용"으로 뒷줄의 첫번째를 띄워줘야한다.
			*/
			
			//sql문을 실행하기 위한 준비
			pstmt = conn.prepareStatement(sql);
			
			//setStrint( , ) 1번째 ?에 id를 대입 2번째 ?에 passwd를 대입 3번째 ?에 name을 대입
			//화면에서 입력받은 값들을 ?에 대입한다
			pstmt.setString(1, id);
			pstmt.setString(2, passwd);
			pstmt.setString(3, name);
			//자료형태가 지금 String이므로 setString
			//다른 형태일 경우 setInt, setDouble 등을 사용한다.
			
			//executeUpdate() : insert, update, delete문
			//executeQuery() : select문
			pstmt.executeUpdate();
			out.println("Member 테이블 삽입이 성공했습니다.");
		}catch(SQLException ex){
			out.println("Member 테이블 삽입이 실패했습니다.<br>");
			out.println("SQLException : " + ex.getMessage());
		}finally{
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