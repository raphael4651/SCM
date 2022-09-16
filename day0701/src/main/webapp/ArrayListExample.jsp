<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		ArrayList<String> a = new ArrayList<String>();
	
		a.add("사과");
		a.add("수박");
		a.add("딸기");
		
		for(String fruit : a){
			out.println(fruit + "<br>");
		}
	
	%>
</body>
</html>








