<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		MultipartRequest multi = new MultipartRequest(
			request, "C:\\upload", 5*1024*1024, "utf-8", new DefaultFileRenamePolicy()
		);

		Enumeration params = multi.getParameterNames();
		
		while (params.hasMoreElements()){
			String name = (String) params.nextElement();
			String value = multi.getParameter(name);
			out.println(name + " = " + value + "<br>");
		}
		out.println("파일업로드 완료");
		
		
	%>
</body>
</html>