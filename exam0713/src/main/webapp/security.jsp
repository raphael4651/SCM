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
		//입력화면에서 입력받은 사용자 명 가져오기
		String id = request.getUserPrincipal().getName();
	
		out.println("사용자명 " + id + " 인증을 성공했습니다.");
	%>
</body>
</html>