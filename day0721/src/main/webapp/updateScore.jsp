<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="updateScore_process.jsp" method="post">
		<p> 변경할 학생번호 : <input type="text" name="sno">
		<p> 변경 국어성적 : <input type="text" name="kor">
		<p> 변경 영어성적 : <input type="text" name="eng">
		<p> 변경 수학성적 : <input type="text" name="math">
		<p> <input type="submit" value="수정">
	</form>
</body>
</html>