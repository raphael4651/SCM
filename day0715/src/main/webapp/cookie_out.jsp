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
		Cookie[] cookies = request.getCookies();
		
		for(int i=0;i<cookies.length;i++){
			
			//쿠키의 유효시간을 0으로 만들어서 삭제
			cookies[i].setMaxAge(0);
			//서버에서 클라이언트에 쿠키를 전송
			response.addCookie(cookies[i]);
		}
		response.sendRedirect("cookie.jsp");
	%>
</body>
</html>