<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">	
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
</head>
<body>
	<%@ include file = "menu.jsp" %>

	<div>
		<div><h1>회원 관리</h1></div>
			
		<table class="table table-hover">
			<thead>
			<tr>
				<th scope="col">아이디</th>
				<th scope="col">비밀번호</th>
				<th scope="col">이름</th>
				<th scope="col">등록일</th>
				<th scope="col">수정일</th>
				<th scope="col">등급</th>
				<th scope="col">수정</th>
				<th scope="col">삭제</th>
			</tr>
			</thead>
			
			<tbody>
			
			<%
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				try{
					String sql = "select * from member";
					
					pstmt = conn.prepareStatement(sql);
					
					rs = pstmt.executeQuery();
					
					while(rs.next()){
						String id = rs.getString("id");
						String password = rs.getString("password");
						String name = rs.getString("name");
						String regdate = rs.getString("regdate");
						String updatedate = rs.getString("updatedate");
						String grade = rs.getString("grade");
			%>
			
				<tr>
					<td scope="row"><%=id%></td>
					<td scope="row"><%=password%></td>
					<td scope="row"><%=name%></td>
					<td scope="row"><%=regdate%></td>
					<td scope="row"><%=updatedate%></td>
					<td scope="row"><%=grade%></td>
					
					<td scope="row"><a href="updateMember.jsp?id=<%=id%>">수정</a></td>
					<td scope="row"><a href="deleteMember.jsp?id=<%=id%>">삭제</a></td>
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
			</tbody>
		</table>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>