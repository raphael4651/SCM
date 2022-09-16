<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>forward Action Tag</h2>
	<%-- 
		제어권이 forward_date.jsp로 넘어가면서
		현재 jsp에 있는 내용이 버퍼에서 삭제됨
		주소창에는 forward2.jsp가 표시가 됨 
	--%>
	<jsp:forward page="forward_date.jsp"/>
</body>
</html>









