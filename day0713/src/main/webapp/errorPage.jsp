<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="errorPage_error2.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 속성의 값이 없는데 출력 NullpointerException 발생 -->
	name 파라미터 : <%=request.getParameter("name").toUpperCase() %>
</body>
</html>