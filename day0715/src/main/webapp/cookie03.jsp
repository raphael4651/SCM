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
			//setMaxAge() 쿠키의 유효시간을 지정
			cookies[i].setMaxAge(0);
			
			//서버에서 클라이언트로 쿠키 전송
			response.addCookie(cookies[i]);
		}
		
		response.sendRedirect("cookie02.jsp");
	%>
</body>
</html>