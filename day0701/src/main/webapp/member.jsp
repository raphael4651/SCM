<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%--
		form
		action: submit을 실행하면 이동하는 jsp를 선언
		method: 전송방식(get,post) 
			get:전송시 매개변수값이 보인다.
			post:전송시 매개변수값이 안보이므로 보안 O 
	 --%>
	<form action="memberProcess.jsp" method="post">
		<p>아이디:<input type="text" name="id">
		<p>비밀번호:<input type="password" name="passwd">
		<p>이름:<input type="text" name="name">
		<p>연락처:<input type="tel" name="phone">
		<p><input type="submit" value="회원가입">
	<%-- Javabeans를 사용해서 입력받은 값을 member.java의 get set filed에 
		대입해서 넣는것을 Mapping 이라 한다.
	 --%>	
	</form>
</body>
</html>