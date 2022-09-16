<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<!DOCTYPE>
<html>
    <head>
    <meta charset="UTF-8">
    </head>
<body>

	<%@ include file="dbconn2.jsp" %>

	<%
		String id = "";
		String passwd = "";
		
		if(request.getParameter("id").equals("admin")){
			
			id = request.getParameter("id");
			session.setAttribute("sessionId", id);
			response.sendRedirect("menu.jsp");
		}
		
		if(request.getParameter("id") == ""){  %>
		     <script>
			 alert("아이디를 입력하세요");
			 document.location.href='./loginForm.jsp'
			 </script>
		    <% }
		else if(request.getParameter("passwd") == ""){ %>
		     <script>
			 alert("비밀번호를 입력하세요");
			 document.location.href='./loginForm.jsp'
			 </script>
		    <% }
		else{
			id = request.getParameter("id"); 
			passwd = request.getParameter("passwd");
		
		 
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery("select * from member where id = '" + id + "' and password ='" + passwd + "'");
			Boolean check = false;
			while(rs.next())
		    {
				String sid = rs.getString("id"); 
		    	session.setAttribute("sessionId", sid); 
				check = true;	
		    }
			if(check){ 
		    %> 
		 			 <script>
		  			 document.location.href='./menu.jsp'
		 			 </script> <%
		    	        rs.close();
		    	    	conn.close();
				}   else  { 
		        %>
		     <script>
			 alert("ID 또는 PW를 잘못 입력했습니다.");
			 document.location.href='./loginForm.jsp'
			 </script>
		    <%    }
	  	 } 
	   %>
</html>