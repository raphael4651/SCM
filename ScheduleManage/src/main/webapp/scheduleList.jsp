<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table{
		width: 600px;
		border: 1px solid #000;
		border-collapse: collapse;
	}
	
	tr, td, th{
		border: 1px solid #000;
		border-collapse: collapse;
		text-align: center;
	}
	
	input{
		color: blue;
	}
</style>
</head>
<body>
	
	<%@ include file = "../dbconn2.jsp" %>
	

	<div>
		<div><h1>스케줄 리스트</h1></div>
		
		<div>
			<input type="button" value="스케줄등록"  onclick="location.href='scheduleForm.jsp'">
			<input type="button" value="로그아웃"  onclick="location.href='logout.jsp'">
			<input type="button" value="메인메뉴"  onclick="location.href='loginForm.jsp'">
		</div>
		
		<table>
			<tr>
				<th>일자</th>
				<th>제목</th>
				<th>내용</th>
				<th>장소</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
			<%
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				try{
					String sql = "select * from schedule";
					
					pstmt = conn.prepareStatement(sql);
					
					rs = pstmt.executeQuery();
					
					while(rs.next()){
						String sdate = rs.getString("sdate");
						String title = rs.getString("title");
						String content = rs.getString("content");
						String location = rs.getString("location");
			%>
				<tr>
					<td><%=sdate%></td>
					<td><%=title%></td>
					<td><%=content%></td>
					<td><%=location%></td>
					<td><a href="scheduleUpdate.jsp?sdate=<%=sdate%>">수정</a></td>
					<td><a href="scheduleDelete.jsp?sdate=<%=sdate%>">삭제</a></td>
				</tr>		
			<%
					}
				}catch(SQLException e){
					out.println("SQLException : " + e);
				}finally{
					try{
						if(rs != null) rs.close();
						if(pstmt != null) pstmt.close();
						if(conn != null) conn.close();
					}catch(SQLException e){
						out.println("SQLException : " + e);
					}
				}
			%>
		</table>
	</div>

</body>
</html>