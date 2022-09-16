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
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		
		if(id.equals("admin") && passwd.equals("admin1234")){
			//쿠키 선언
			Cookie cookie_id = new Cookie("userID", id);
			Cookie cookie_pw = new Cookie("userPW", passwd);
			
			//쿠키의 유효시간 3시간
			cookie_id.setMaxAge(3*60*60);
			//서버가 클라이언트에게 쿠키 전송
			response.addCookie(cookie_id);
			
			response.sendRedirect("cookie_welcome.jsp");
		}else{
			out.println("<script>");
			out.println("alert('아이디나 비밀번호를 확인하세요!')");
			out.println("location.href='cookie.jsp'");
			out.println("</script>");
		}
	%>
</body>
</html>