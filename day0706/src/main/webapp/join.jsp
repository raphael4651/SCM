<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <jsp:include page="header.jsp"/>
	<form action="#" method="post">
		<p>아이디:<input type="text" name="id">
		<p>비밀번호:<input type="password" 
						 name="passwd">
		<p>이름:<input type="text" name="name">
		<p>연락처:<input type="text" name="phone">
		<p>이메일:<input type="text" name="email">
		<p>:<input type="submit" value="회원가입">
	</form>
	<jsp:include page="footer.jsp"/>
</body>
</html>







