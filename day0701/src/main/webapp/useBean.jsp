<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4>구구단 출력하기</h4>
	<%-- 
		scope 정의: 속성값이 살아있는 유효범위
		page : 현재 jsp 페이지 에서만 값이 유효
		request : 클라이언트의 요청에 대해서 서버가 응답처리 하기 전까지 값이 유효
		session : 같은 브라우저에서만 값이 유효
		application : 애플리케이션이 실행되고 있는 동안 값이 유효
	 --%>
	<jsp:useBean id="gugudan" class="beans.GuGuDan" scope="request"/>
	
	<%
		for(int i=1;i<=9;i++){
			out.print(5 + "*" + i + "=" + gugudan.Process(i) + "<br>");
		}
	%>
</body>
</html>