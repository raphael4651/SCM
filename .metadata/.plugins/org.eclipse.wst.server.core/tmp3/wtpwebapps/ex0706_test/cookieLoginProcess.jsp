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
		
		if(userId.equals("test") && userPw.equals("test1234")){
			
			Cookie idCookie = new Cookie("user_id", userId);
			Cookie pwCookie = new Cookie("user_pw", userPw);
			
			response.addCookie(idCookie);
			response.addCookie(pwCookie);
			
			Cookie[] cookies = request.getCookies();
			
			for(int i=0; i<cookies.length; i++){
				
				cookies[i].setMaxAge(60*60*3);
				
				response.addCookie(cookies[i]);
			}
			
			out.println("쿠키 생성 성공 <br>");
			out.println("아이디 쿠키이름:" + cookies[1].getName() + "<br>");
			out.println("아이디 쿠키값:" + cookies[1].getValue() + "<br>");
			out.println("비밀번호 쿠키이름:" + cookies[2].getName() + "<br>");
			out.println("비밀번호 쿠키값:" + cookies[2].getValue() + "<br>");
			
		}else{
			out.println("아이디 혹은 비밀번호 오류");
		}
		
	%>
</body>
</html>