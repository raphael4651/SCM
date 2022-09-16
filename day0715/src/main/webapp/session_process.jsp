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
			session.setAttribute("userID", id);
			//강제로 이동처리
			response.sendRedirect("welcome.jsp");
		}else{
			out.println("<script>");
			out.println("alert('아이디나 비밀번호를 확인하세요!')");
			out.println("location.href='session.jsp'");
			out.println("</script>");
		}
			
	%>
</body>
</html>