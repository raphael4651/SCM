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
		파일 업로드시 
		enctype="multipart/form-data" 필수
		
		업로드 속성은 반드시 file로 지정
	 --%>
	<form action="uploadExample01.jsp"
	      method="post"
	      enctype="multipart/form-data">
		<p>제목:<input type="text" name="title">
		<p>파일:<input type="file" name="fileName">
		<p><input type="submit" value="전송">
	</form>
</body>
</html>







