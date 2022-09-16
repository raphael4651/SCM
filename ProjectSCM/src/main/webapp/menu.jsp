<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"> 


<%
	String sessionId = (String) session.getAttribute("sessionId");
	String sessionGrade = (String) session.getAttribute("sessionGrade");
%>
</head>
<body>
	<!-- 데이터베이스 연결 설정 -->
	<%@ include file = "dbconn.jsp" %>
	
	
	<!-- 데이터베이스 연결 설정 -->
	
<nav class="navbar navbar-expand-md navbar-light bg-primary sticky-top">
  <a style="padding-top:8px; color:yellow;font-size:18px" class="navbar-brand" href="#">SCM</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav">
  
		<c:choose>
		 <c:when test="${empty sessionId}">
	        <li class="nav-item dropdown">
				<a style="padding-top:8px; color:white;font-size:18px" class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-expanded="false">
		          게시판
		        </a>
		        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
		          <a class="dropdown-item" href="<c:url value="#"/>">게시판</a>	       
		        </div>
	        </li>
		        
	        <li class="nav-item dropdown">
		        <a style="padding-top:8px; color:white;font-size:18px" class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-expanded="false">
		          공지사항
		        </a>
		        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
		          <a class="dropdown-item" href="<c:url value="#"/>">공지사항</a>	       
		        </div>
	        </li>
			</c:when>
      
	      <c:when test="${sessionGrade == 'S'}">
	      <li class="nav-item dropdown">
	        <a style="padding-top:8px; color:white;font-size:18px" class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-expanded="false">
	          제품관리
	        </a>
	        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
	          <a class="dropdown-item" href="<c:url value="products.jsp"/>">제품조회</a>
	          <a class="dropdown-item" href="<c:url value="addProduct.jsp"/>">제품등록</a>	  
	        </div>
	      </li>
	      <li class="nav-item dropdown">
	        <a style="padding-top:8px; color:white;font-size:18px" class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-expanded="false">
	          구매관리
	        </a>
	        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
	          <a class="dropdown-item" href="<c:url value="order.jsp"/>">제품주문</a>
	          <a class="dropdown-item" href="<c:url value="#"/>">장바구니</a>
	          <a class="dropdown-item" href="<c:url value="#"/>">주문내역</a>
	        </div>
	      </li>
	      <li class="nav-item dropdown">
	        <a style="padding-top:8px; color:white;font-size:18px" class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-expanded="false">
	          물류관리
	        </a>
	        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
	          <a class="dropdown-item" href="<c:url value="#"/>">입출고현황</a>
	          <a class="dropdown-item" href="<c:url value="#"/>">입출고관리</a>
	          <a class="dropdown-item" href="<c:url value="#"/>">재고관리</a>
	        </div>
	      </li>
	      <li class="nav-item dropdown">
	        <a style="padding-top:8px; color:white;font-size:18px" class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-expanded="false">
	          분석
	        </a>
	        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
	          <a class="dropdown-item" href="<c:url value="#"/>">조회</a>
	          <a class="dropdown-item" href="<c:url value="#"/>">분석</a>
	        </div>
	      </li>
	      <li class="nav-item dropdown">
	        <a style="padding-top:8px; color:white;font-size:18px" class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-expanded="false">
	          회원정보
	        </a>
	        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
	          <a class="dropdown-item" href="<c:url value="management.jsp"/>">정보수정</a>	     
	        </div>
	      </li>
	       <li class="nav-item dropdown">
	      <a style="padding-top:8px; color:white;font-size:18px" class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-expanded="false">
			          게시판
			        </a>
			        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
			          <a class="dropdown-item" href="<c:url value="#"/>">게시판</a>	       
			        </div>
          </li>
          <li class="nav-item dropdown">
          <a style="padding-top:8px; color:white;font-size:18px" class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-expanded="false">
			          공지사항
			        </a>
			        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
			          <a class="dropdown-item" href="<c:url value="#"/>">공지사항</a>	       
			        </div>
          </li>
	      </c:when>
	      
	      <c:when test="${sessionGrade == 'A'}">
	      <li class="nav-item dropdown">
	        <a style="padding-top:8px; color:white;font-size:18px" class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-expanded="false">
	          회원 물류관리
	        </a>
	        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
	          <a class="dropdown-item" href="<c:url value="#"/>">발주조회</a>
	          <a class="dropdown-item" href="<c:url value="#"/>">납품입력</a>
	          <a class="dropdown-item" href="<c:url value="#"/>">납품조회</a>
	        </div>
	      </li>
	      <li class="nav-item dropdown">
	        <a style="padding-top:8px; color:white;font-size:18px" class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-expanded="false">
	          회원 정산
	        </a>
	        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
	          <a class="dropdown-item" href="<c:url value="#"/>">조회</a>
	          <a class="dropdown-item" href="<c:url value="#"/>">분석</a>
	        </div>
	      </li>
	      <li class="nav-item dropdown">
	        <a style="padding-top:8px; color:white;font-size:18px" class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-expanded="false">
	          회원정보
	        </a>
	        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
	          <a class="dropdown-item" href="<c:url value="management.jsp"/>">회원정보수정</a>     
	        </div>
	      </li>
	      <li class="nav-item dropdown">
	      <a style="padding-top:8px; color:white;font-size:18px" class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-expanded="false">
			          게시판
			        </a>
			        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
			          <a class="dropdown-item" href="<c:url value="#"/>">게시판</a>	       
			        </div>
          </li>
          <li class="nav-item dropdown">
          <a style="padding-top:8px; color:white;font-size:18px" class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-expanded="false">
			          공지사항
			        </a>
			        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
			          <a class="dropdown-item" href="<c:url value="#"/>">공지사항</a>	       
			        </div>
          </li>
	      </c:when>
	     </c:choose> 
      </ul>
   </div>
   
	<div class="collapse navbar-collapse justify-content-end" id="navbarSupportedContent">
		<ul class="navbar-nav">
		      <li class="nav-item dropdown">
		<c:choose>
	      <c:when test="${empty sessionId}">
			  <ul class="navbar-nav">
			      <li class="nav-item"><a class="nav-link" style="padding-top:8px; color:#F1FD0C;font-size:18px" class="dropdown-item" href="<c:url value="login.jsp"/>"><i class="fa fa-sign-in fa-2x align-middle"></i> 로그인</a></li>
			      <li class="nav-item"><a class="nav-link" style="padding-top:8px; color:#F1FD0C;font-size:18px" class="dropdown-item" href="<c:url value="join.jsp"/>"><i class="fa fa-user-circle fa-2x align-middle"></i> 회원가입</a></li>
		      </ul>
		 </c:when>
		 
		<c:when test="${sessionGrade == 'S'}">
			  <li style="padding-top:8px; color:yellow;font-size:18px"><%=sessionId%>님 환영합니다.</li>
		      <li class="nav-item dropdown">
		      	<a style="padding-top:8px; color:white;font-size:18px" class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-expanded="false">
	       					관리자용
	     		</a>
		        <ul class="dropdown-menu dropdown-menu-right">					         
		          <li class="dropdown-item"><a class="dropdown-item" href="<c:url value="logout.jsp"/>">로그아웃 </a></li>
			      <li class="dropdown-item"><a class="dropdown-item" href="<c:url value="memberManagement.jsp"/>">회원등급관리</a></li>
		        </ul>
		      </li>  
		</c:when>	
		
		<c:when test="${sessionGrade == 'A'}">
			<li style="padding-top:8px; color:white;font-size:22px">[<%=sessionId%>님]</li>
			<li style="font-weight:bold" class="nav-item"><a class="btn-lg nav-link" href="<c:url value="logout.jsp"/>">로그아웃 </a></li>
		</c:when>
		</c:choose>	
		</li>
		</ul>				
	</div>  
   	
</nav>

<hr>
</body>
</html>