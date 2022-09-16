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
		String user_id = request.getParameter("id");
		String user_pw = request.getParameter("passwd");
		
		if(user_id.equals("admin") && user_pw.equals("1234")){
			
			//쿠키(Cookie)
			//쿠키는 서버가 클라이언트에 저장하는 정보로 클라이언트와의 연결이 끊기더라도
			//저장된 쿠키정보가 유지되어 서버에 재요청시 요청정보의 헤더안에 쿠키정보가 
			//서버로 전송된다.
			
			//Cookie 클래스를 통해서 new Cookie(인스턴스)를 생성
			Cookie cookie_id = new Cookie("userID", user_id);
			Cookie cookie_pw = new Cookie("userPW", user_pw);
			
			//서버가 클라이언트에 응답처리시 쿠키를 생성하여 전송
			//명령문이 있어야 클라이언트에 전송을 한다.
			response.addCookie(cookie_id);
			response.addCookie(cookie_pw);
			
			out.println("쿠키 생성이 성공했습니다<br>");
			out.println(user_id + "님 환영합니다.");
		}else{
			out.println("쿠키 생성이 실패했습니다.");
		}
	%>
</body>
</html>