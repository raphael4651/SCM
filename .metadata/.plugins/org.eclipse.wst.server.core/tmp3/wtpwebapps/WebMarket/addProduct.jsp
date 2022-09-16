<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품등록</title>
<link rel="stylesheet" 
      href="./resources/css/bootstrap.min.css">
<script src="./resources/js/validation.js"></script>
</head>
<body>
	
	<%-- 한국어,영어 클릭시 로케일 변경 --%>
	<fmt:setLocale value='<%=request.getParameter("language")%>'/>
	
	<%-- 
		한국어 클릭하면 message.properties 파일에서
		값을 가져오고 영어를 클릭하면 
		message_en.properties
		파일에서 값을 가져온다. 
	--%>
	<fmt:bundle basename="bundle.message">

	<jsp:include page="menu.jsp"/>
	
	<%-- 타이틀 선언 --%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3"><fmt:message key="title"/></h1>
		</div>
	</div>
	
	<div class="container">
	
		<div class="display-5 text-right">
			<a href="?language=ko">한국어</a>|
			<a href="?language=en">영어</a>
			<a href="logout.jsp" class="btn btn-sm btn-success pull-right">로그아웃</a>
		</div>
	
		<form name="newProduct" 
		      action="./processAddProduct.jsp" 
		      class="form-horizontal" 
		      method="post"
		      enctype="multipart/form-data">
		      
		    <%-- 
		    	타이틀과 입력창을 가로로 배열
		    	
		    	부트스트랩 그리드 방식
		    	1.col-xs-* : 항상 가로로 배치
		    	2.col-sm-* : 해상도가 768px이하에서는
		    	  세로로 표시 
		        3.col-md-* : 해상도가 992px이하에서는
		          세로로 표시
		        4.col-lg-* : 해상도가 1200px이하에서는
		          세로로 표시  
		    --%>  
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="productId"/></label>
				<div class="col-sm-3">
					<input type="text" 
						   id="productId"
					       name="productId" 
					       class="form-control">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="pname"/></label>
				<div class="col-sm-3">
					<input type="text" id="name" name="name" class="form-control">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="unitPrice"/></label>
				<div class="col-sm-3">
					<input type="text" 
					       id="unitPrice" name="unitPrice" class="form-control">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="description"/></label>
				<div class="col-sm-5">
					<textarea name="description" cols="50" rows="2" 
						      class="form-control"></textarea>
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="manufacturer"/></label>
				<div class="col-sm-3">
					<input type="text" 
					       name="manufacturer" class="form-control">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="category"/></label>
				<div class="col-sm-3">
					<input type="text" name="category" class="form-control">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="unitsInStock"/></label>
				<div class="col-sm-3">
					<input type="text" id="unitsInStock" name="unitsInStock" class="form-control">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="condition"/></label>
				<div class="col-sm-5">
					<input type="radio" name="condition" value="New"><fmt:message key="condition_New"/>
					<input type="radio" name="condition" value="Old"><fmt:message key="condition_Old"/>
					<input type="radio" name="condition" value="Refurbished"><fmt:message key="condition_Refurbished"/>
				</div>
			</div>
			
			<%-- page 244 --%>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="productImage"/></label>
				<div class="col-sm-5">
					<input type="file" name="productImage" class="form-control">
				</div>	
			</div>

			<%-- 
				col-sm-offset-2
				offset은 왼쪽으로 부터 2크기만큼
				띄움
			 --%>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="button" 
					       class="btn btn-primary" 
					       value="<fmt:message key="button"/>"
					       onclick="CheckAddProduct();">
				</div>
			</div>
			
		</form>
	</div>
</fmt:bundle>	
</body>
</html>