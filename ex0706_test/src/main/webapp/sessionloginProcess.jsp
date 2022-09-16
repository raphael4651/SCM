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
		request.setCharacterEncoding("utf-8");
		
		String userId = request.getParameter("id");
		String userPw = request.getParameter("passwd");
		
		if(userId.equals("admin") && userPw.equals("admin1234")){
			
			session.setAttribute("id", userId);
			session.setAttribute("passwd", userPw);
	%>
		<form action="sessionLogout.jsp">
			<p><input type="submit" value="로그아웃">
		</form>
	<%
		}else{
			out.println("아이디나 비밀번호 오류");
		}
	%>
</body>
</html>