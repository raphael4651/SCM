<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 아이디 오류</title>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
</head>
<body>
	<%-- 
		상품을 상세보기시 상품아이디가 없으면
		처리하는 오류 처리 페이지 
	--%>
	<jsp:include page="menu.jsp"/>
	
	<div class="jumbotron">
		<div class="container">
			<h2 class="alert alert-danger">해당 상품이 존재하지 않습니다.</h2>
		</div>
	</div>
	
	<%--
		request.getRequestURL()?
		클라이언트가 요청하는 전체 주소값을 리턴하는데
		매개변수는 제외
		
		request.getQueryString()?
		매개변수값을 리턴
	 --%>
	<div class="container">
		<p><%=request.getRequestURL()%>?<%=request.getQueryString()%>
		<p><a href="products.jsp" class="btn btn-secondary">상품목록&raquo;</a>
	</div>
	
</body>
</html>








