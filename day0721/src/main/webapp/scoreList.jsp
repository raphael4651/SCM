<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생성적 리스트</title>
<style>
	body{
		text-align: center;
	}
	
	table{
		width: 500px;
		border-collapse: collapse;
		border: 1px solid #000;
	}
	
	tr, td, th{
		border: 1px solid #000;
	}
</style>
</head>
<body>
	<%@ include file = "dbconn.jsp" %>
	
	<table align="center">
		
			<caption>학생성적 리스트</caption>
		
		<tr>
			<th>학생번호</th>
			<th>학생이름</th>
			<th>국어</th>
			<th>영어</th>
			<th>수학</th>
			<th>총점</th>
			<th>학점</th>
		</tr>
		
		<%
			ResultSet rs = null;
			Statement stmt = null;
			
			try{
				String sql = "select * from score order by sname";
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				
				while(rs.next()){
					int sno = rs.getInt("sno");
					String sname = rs.getString("sname");
					int kor = rs.getInt("kor");
					int eng = rs.getInt("eng");
					int math = rs.getInt("math");
					int total = rs.getInt("total");
					String grade = rs.getString("grade");
					
		%>
				<tr>
					<td><%=sno %></td>
					<td><%=sname %></td>
					<td><%=kor %></td>
					<td><%=eng %></td>
					<td><%=math %></td>
					<td><%=total %></td>
					<td><%=grade %></td>
				</tr>
		<%
				}
				
			}catch(SQLException ex){
				out.println("score 테이블 접근 실패 <br>");
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