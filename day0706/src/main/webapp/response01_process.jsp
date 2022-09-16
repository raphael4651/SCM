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
		//request:내장객체이므로 선언하지 않고 
		//바로 사용 가능
		//입력 화면에서 입력하는 한글 깨짐 방지
		request.setCharacterEncoding("utf-8");
		
		//입력화면에서 입력한 아이디 비밀번호 가져온다.
		String userid = request.getParameter("id");
		String password = request.getParameter("passwd");
		
		//문자열을 비교할때는 ==(주소값) 아니고 반드시
		//equals()메서드로 비교
		if(userid.equals("admin") && 
		   password.equals("admin1234")){
			
			//정상적으로 로그인 된 경우 아이디를
			//session 속성으로 지정
			//session 속성으로 지정하면 
			//브라우저가 close되기전까지 값이 유효함
			session.setAttribute("userid",userid);
			
			
			//response.sendRedirect ?
			//강제로 제어권을 다른 jsp로 넘긴다.		
			response.sendRedirect("main.jsp");
		}else{
			//아이디나 비밀번호 오류이면 로그인 화면으로 이동
			response.sendRedirect("response01.jsp");
		}
		
	%>
</body>
</html>



