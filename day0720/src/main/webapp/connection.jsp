<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- sql 사용을 위한 import -->
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Database SQL</title>
</head>
<body>
	<%
		//데이터베이스 연결을 위한 객체 선언
		//Connection 객체를 null값을 가진 conn으로 초기화
		Connection conn = null;
	
		try{
			//데이터베이스 연결 정보
			String url = 
				"jdbc:mysql://localhost:3307/WebMarketDB?serverTimezone=Asia/Seoul";
			/* sql jar 버전이 8. 버전이므로 serverTimezone=Asia/Seoul 이 반드시 들어가야
					에러가 나지 않는다. */
					
			//아이디
			String user = "shop";
			//비밀번호
			String password = "shop1234";
			
			/* mysql jar file을 로딩 */
			/* Class.forName("com.mysql.jdbc.Driver"); */
			/* 위는 책에 있는 5. 버전 밑은 8. 버전 */
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			//데이터베이스 연결 시도
			conn = DriverManager.getConnection(url, user, password);
			out.println("데이터베이스 연결이 성공했습니다.");
			
		}catch(SQLException ex){
			//예외발생시 처리 catch
			out.println("데이터베이스 연결이 실패했습니다.<br>");
			out.println("SQLException : " + ex.getMessage());
		
		}finally{
			//무조건 실행
			if(conn != null){
				//Connection을 위에서 열었기 때문에 반드시
				// close()로 객체를 메모리에서 소멸시켜야한다.
				conn.close();
			}
		}
	%>
</body>
</html>