<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		//jsp의 내용을 엑셀파일로 저장
		response.setHeader(
				"Content-Type",
				"application/vnd.ms-excel");
	    response.setHeader("Content-Disposition",
	    		"attachment;filename=test.xls");
	%>
	
	Today is : <%=new java.util.Date()%>
	
</body>
</html>





