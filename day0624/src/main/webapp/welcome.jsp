<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%-- 
  부트스트랩을 사용하기 위해 CDN 방식을 이용하여
  bootstrap.min.css파일을 불러온다.
 --%>
<link rel="stylesheet" 
      href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Welcome</title>
</head>
<body>
	<%-- 
	   nav 태그 : 메뉴
	   navbar-expand :화면크기 속성
	   navbar-dark : 글자색 흰색
	   bg-dark : 배경색 검정색  
	--%>
	<nav class="navbar navbar-expand navbar-dark bg-dark">
		<%-- 영역 설정 --%>
		<div class="container">
			<%-- 메뉴 상단 설정 --%>
			<div class="navbar-header">
			    <%-- 이미지 설정 --%>
				<a class="navbar-brand" href="./welcome.jsp">Home</a>
			</div>
		</div>	
	</nav>
	
	<%--선언문 --%>
	<%!
		String greeting = "WelCome to Web Shopping Mall";
		String tagline = "Welcome to Web Market!";
	%>
	
	<%-- 부트스트랩 제목 설정 --%>
	<div class="jumbotron">
		<div class="container">
		     <%-- 글자크기 --%>
			<h1 class="display-3">
				<%=greeting%>
			</h1>
		</div>	
	</div>
	<div class="container">
	    <%-- 가운데 정렬 --%>
		<div class="text-center">
			<h3>
				<%=tagline%>
			</h3>
		</div>
		<hr>
	</div>
	
	<%-- 하단 css 설정 --%>
	<footer class="container">
		<p>&copy;WebMarket</p>
	</footer>
</body>
</html>





