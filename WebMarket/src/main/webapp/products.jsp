<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.Date" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품목록</title>
</head>
<body>
				
	<%-- 다른 jsp를 호출 --%>			 
	<jsp:include page="menu.jsp"/>
	
	<%-- 제목 선언 --%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 목록</h1>
		</div>
	</div>

	<div class="container">
		<div class="row" align="center">
			<%@ include file="dbconn.jsp"%>
			
			<%
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				String sql = "select * from product";
				
				pstmt = conn.prepareStatement(sql);
				
				rs = pstmt.executeQuery();
				
				while(rs.next()){
			%>
			<%-- 
				부트스트랩은 가로로 12등분하는데
				col-md-4로 선언하면 한행에 3개씩 출력한다.
			 --%>
			<div class="col-md-4">
				<img src="./resources/images/<%=rs.getString("p_fileName")%>" style="width:100%">
				<h3><%=rs.getString("p_name")%></h3>
				<p><%=rs.getString("p_description")%>
				<p><%=rs.getString("p_unitPrice")%>원
				<p>
				<%--
					p174 상세보기 버튼 처리
					상세보기 버튼을 클릭하면 product.jsp로 
					이동시 상품코드값을 매개변수로 전달
				 --%>
				<a class="btn btn-primary" 
				   href="./product.jsp?id=<%=rs.getString("p_id")%>"
				   role="button">
				   상세보기 &raquo;
				</a>
				
				
			</div>
			<%
				}
			%>
			<hr>
		</div>
		<jsp:include page="footer.jsp"/>	
	</div>
</body>
</html>






