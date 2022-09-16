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
	<!-- DB연결정보가 담긴 jsp르 ㄹinclude -->
	<%@ include file = "dbconn.jsp" %>
	
	<%
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		String name = request.getParameter("name");
		
		/* 입력받은 값을 데이터베이스에 입력하는 정적 인터페이스 */
		Statement stmt = null;
		
		try{
			/* Statement는 sql문을 쓸때 코딩이 PreparedStatement보다 어렵다 */
			//화면에서 입력받은 값을 테이블에 insert 하기 위해서 sql문을 선언
			String sql = "INSERT INTO Member(id, passwd, name) VALUES('" + id + "','" + passwd + "','" + name + "')";
			
			//위에서 선언한 sql문장을 실행하기 위해 준비
			stmt = conn.createStatement();
			
			//executeUpdate : insert, update, delete문을 실행시 사용
			//executeQuery(): select문을 실행시
			stmt.executeUpdate(sql);
			
			out.println("테이블 삽입이 성공했습니다.");
			
		}catch(SQLException ex){
			out.println("테이블 삽입이 실패했습니다.<br>");
			out.println("SQLException : " + ex.getMessage());
			
		}finally{
			//메모리에서 Statement와 Conncet 객체를 소멸시킨다.
			if(stmt != null){
				stmt.close();
			}
			if(conn != null){
				conn.close();
			}
		}
	%>
</body>
</html>