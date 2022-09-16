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
	
		String user_id = request.getParameter("id");
		String user_pw = request.getParameter("passwd");
		
		if(user_id.equals("admin") && user_pw.equals("1234")){
			//정상적으로 로그인 했으면
			//속성을 새로 지정("userID"에 user_id값을 지정)
			session.setAttribute("userID", user_id);
			session.setAttribute("userPW", user_pw);
			
			out.println("세션 설정이 성공했습니다.<br>");
			out.println(user_id + "님 환영합니다.");
		}else{
			out.println("세션 설정이 실패했습니다.");
		}
		
	%>
</body>
</html>