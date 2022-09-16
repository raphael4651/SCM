<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>


<html>
<head>
<title>스케줄 수정</title>
<style>
	table{
		border: 1px solid #000;
		width: 450px;
	}
		
	th, tr, td{
		padding: 10px;
		border: 1px solid #000;
		text-align: center;
	}
</style>
</head>
<body>
	<%@ include file = "dbconn2.jsp" %>
	
	<%
		String sdate = request.getParameter("sdate");
	
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			String sql = "select * from schedule where sdate = ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, sdate);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
			String title = rs.getString("title");
			String content = rs.getString("content");
			String location = rs.getString("location");
			
	%>
		<form name="frm" action="scheduleUpdateProcess.jsp" method="post">
			<table>
			<tr>
				<th colspan="2">스케줄등록 페이지</th>
			</tr>
			<tr>
				<td>회의일자:</td>
				<td><input type="text" name="sdate" value="<%=sdate%>"></td>
			</tr>
			<tr>
				<td>제목:</td>
				<td><input type="text" name="title" value="<%=title%>"></td>
			</tr>
			<tr>
				<td>내용:</td>
				<td><input type="text" name="content" value="<%=content%>"></td>
			</tr>
			<tr>
				<td>장소:</td>
				<td><input type="text" name="location" value="<%=location%>"></td>
			</tr>
			<tr>
				<td colspan="2"><a href="javascript:frm.submit();">수정</a>&nbsp;&nbsp;&nbsp;<a href="#">다시작성</a></td>
			</tr>
		</table>
		</form>
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
	
		


</body>
</html>