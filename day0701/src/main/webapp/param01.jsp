<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>param 액션 태그</h3>
	<%-- 제어권이 param01_data.jsp 로 forward 넘어감 
		인코딩(encoding) 문자열을 인식 할 수 있도록 바이트로 변환하는 과정
		디코딩(decoding) 바이트 형식을 다시 문자열로 복원하는 과정
	--%>
	<jsp:forward page="param01_data.jsp">
		<jsp:param name="id" value="admin" />
		<jsp:param name="name" value='<%=java.net.URLEncoder.encode("관리자") %>'/>
	</jsp:forward>
	<p>Java Server Page</p>
	
</body>
</html>