<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>    
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<%-- 
  부트스트랩을 사용하기 위해 CDN 방식을 이용하여
  bootstrap.min.css파일을 불러온다.
 --%>
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

	<%@ include file="menu.jsp" %>
	
	<%--선언문 --%>
	<%!
		String greeting = "웹 쇼핑몰에 오신 것을 환영합니다.";
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
			<%
			   
			    //p176
			    //1초마다 현재일시를 화면에 출력한다.
			    response.setIntHeader("refresh",1);
			  
				Date day = new java.util.Date();
			
				SimpleDateFormat sf = 
				new	SimpleDateFormat(
						"yyyy년MM월dd일 a hh:mm:ss E요일");
				
				String today = sf.format(day);
				
				out.println("현재시간:" + today);
			
		
			%>
		</div>
		<hr>
	</div>
	
	<%@ include file="footer.jsp" %>
	
</body>
</html>





