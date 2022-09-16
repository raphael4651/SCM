<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file = "dbconn.jsp" %>
	
	
	<%
	String id = "";
	String password = "";
	
		if(request.getParameter("id") == ""){  %>
	    <script>
		 alert("아이디를 입력하세요");
		 document.location.href='./login.jsp'
		 </script>
	   <% }
		else if(request.getParameter("password") == ""){ %>
		    <script>
			 alert("비밀번호를 입력하세요");
			 document.location.href='./login.jsp'
			 </script>
		   <% }
		else{
			id = request.getParameter("id");
			password = request.getParameter("password");
		
		
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery("select * from member where id = '" + id + "' and password ='" + password + "'");
			Boolean check = false;
			while(rs.next())
		   {
				String sid = rs.getString("id"); 
				String sgrade = rs.getString("grade");
		   	session.setAttribute("sessionId", sid); 
		   	session.setAttribute("sessionGrade", sgrade);
				check = true;	
		   }
			if(check){ 
		   %> 
				 <script>
	 			 document.location.href='./menu.jsp'
				 </script> 
		 	<%
	   	        rs.close();
	   	    	conn.close();
			}   else  { 
	       %>
		    <script>
			 alert("ID 또는 PW를 잘못 입력했습니다.");
			 document.location.href='./login.jsp'
			 </script>
		   <%    }
			 } 
		%>



</body>
</html>