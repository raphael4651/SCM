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
	<!-- 데이터베이스 연결 정보를 가져온다. -->
	<%@ include file = "dbconn.jsp" %>

	<table width="300" border="1">
		<tr>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이름</th>
		</tr>
		
		<%
			/* select문을 실행한 후 결과값을 가지고 있는 객체 */
			ResultSet rs = null;
			/* 데이터베이스 연결 인터페이스 */
			Statement stmt = null;
			
			try{
				String sql = "select * from member";
				
				/* SQL문을 실행하기 위해 준비 */
				stmt = conn.createStatement();
				
				/* select문을 실행해서 ResultSet에 대입 */
				rs = stmt.executeQuery(sql);
				
				/* while문을 통해 rs에 있는 값을 한행씩 불러온다. */
				while(rs.next()){
					
					/* getString("db의 table에 있는 columns") */
					String id = rs.getString("id");
					String pw = rs.getString("passwd");
					String name = rs.getString("name");			
		%>	
			
		<tr>
			<td><%=id %></td>
			<td><%=pw %></td>
			<td><%=name %></td>
		</tr>
		
		<%
				}
			}catch(SQLException ex){
				out.println("Member 테이블 호출 시류ㅐ <br>");
				out.println("SQLException : " + ex.getMessage());
				
			}finally{
				if(rs != null){
					rs.close();
				}
				if(stmt != null){
					stmt.close();
				}
				if(conn != null){
					conn.close();
				}
			}
		%>
		
	</table>

</body>
</html>