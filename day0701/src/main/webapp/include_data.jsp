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
		//request.getParameter() 로 전달되는 값은 문자열로 인식된다.
		int num = Integer.parseInt(request.getParameter("num"));
		//문자열을 정수로 변환
		
		for(int i=1;i<=9;i++){
			out.println(num + "*" + i + "=" + num*i + "<br>");
		}
	%>
</body>
</html>