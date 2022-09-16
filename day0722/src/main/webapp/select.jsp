<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table {
		border-collapse:collapse;
		border:1px solid #000;
	}
	
	tr,td,th {
		border:1px solid #000;
	}
</style>
</head>
<body>
	<%@ include file="dbconn.jsp" %>
	
	<table>
		<tr>
			<th>학번</th>
			<th>학과</th>
			<th>이름</th>
			<th>주소</th>
			<th>연락처</th>
		</tr>
		<%
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try{
				String sql = "select * from student";
				
				pstmt = conn.prepareStatement(sql);
				
				rs = pstmt.executeQuery();
				
				while(rs.next()){
					String num = rs.getString("num");
					String depart = rs.getString("depart");
					String name = rs.getString("name");
					String address = rs.getString("address");
					String phone = rs.getString("phone");
			%>				
			<tr>
				<td><%=num%></td>
				<td><%=depart%></td>
				<td><%=name%></td>
				<td><%=address%></td>
				<td><%=phone%></td>
			</tr>	
		<%	
				}	
			}catch(SQLException e){
				out.println("<script>");
				out.println("alert('데이터 조회 실패')");
				out.println("</script>");
			}finally{
				if(pstmt != null) pstmt.close();
				if(rs != null) rs.close();
				if(conn != null) conn.close();
			}
		%>
	</table>
</body>
</html>