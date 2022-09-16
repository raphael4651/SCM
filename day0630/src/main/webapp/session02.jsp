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
		//Session 값 저장
		session.setAttribute("id", "test");
		session.setAttribute("passwd", "test1234");
		//set 값 지정한다, get 값을 가져온다
		
		//Session에 저장된 값 가져오기
		String id = (String)session.getAttribute("id");
		String passwd = (String)session.getAttribute("passwd");
		//(String) Casting (형변환) .getAttribute()의 return값이 object이므로 
		// Casting 해야한다.
		
		out.println("session id값: " + id + "<br>");
		out.println("session passwd값: " + passwd);
	%>
	
	
	

</body>
</html>