<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script>
$(document).ready(function() {
	$('select[name="dropdown"]').val("grade");
	});
</script>

</head>
<body>
	<%@ include file = "menu.jsp" %>

	<%
		String id = request.getParameter("id");
	
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    
	    try{
	    	String sql = "select * from member where id=?";
	    	
	    	pstmt = conn.prepareStatement(sql);
	    	
	    	pstmt.setString(1, id);
	    	
	    	rs = pstmt.executeQuery();
	    	
	    	if(rs.next()){
	    		String name = rs.getString("name");
	    		String password = rs.getString("password");
	    		String grade = rs.getString("grade");
	    	
   	%>
   		<form name="frm" action="updateMemberProcess.jsp" method="post">
   			<table class="table table-hover">
   				<thead>
   					<tr>
   						
   						<th scope="col">이름</th>
   						<th scope="col">아이디</th>
   						<th scope="col">비밀번호</th>
   						<th scope="col">등급</th>
   					</tr>
   				</thead>
   				<tbody>
   					<tr>   				
   						<td scope="row"><input type="text" name="name" value="<%=name%>"></td>
   						<td scope="row"><input type="text" name="id" value="<%=id%>"></td>
   						<td scope="row"><input type="text" name="password" value="<%=password%>"></td>
   						<select name="dropdown" id="dropdown" class="drop">
   							<option value="S">S</option>
   							<option value="A">A</option>
   							<option value="B">B</option>
   							<option value="C">C</option>
   						</select>
   					</tr>
   					<tr>
   						<td colspan="3"><a href="javascript:frm.submit();">수정</a></td>
   					</tr>
   				</tbody>
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
	    		if(conn != null) pstmt.close();
	    	}catch(SQLException e){
		    	out.println("SQLException : " + e);
	    	}
	    }
	%>
</body>
</html>