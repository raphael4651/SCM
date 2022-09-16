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
		//세션에 지정한 세션값을 가져온다.
		//session.getAttribute의 return값은 object 이므로 (String)으로 캐스팅해야한다.
		String user_id = (String) session.getAttribute("userID");
		String user_pw = (String) session.getAttribute("userPW");
		
		out.println("설정된 세션의 속성 값[1] : " + user_id + "<br>");
		out.println("설정된 세션의 속성 값[2] : " + user_pw);
	
	%>
</body>
</html>