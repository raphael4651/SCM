<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="exceptionNoProductId.jsp"%>

<%@ include file="dbconn.jsp"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품상세정보</title>
<script>
	function addToCart(){
		if(confirm("상품을 장바구니에 추가하시겠습니까?")){
			document.addForm.submit();
		}else{
			document.addForm.reset();
		}
	}
</script>
</head>
<body>

	<jsp:include page="menu.jsp"/>
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 정보</h1>
		</div>
	</div>
	
	<%
		//상세보기 버튼 클릭시 상품코드를 가져온다.
		String productId = request.getParameter("productId");
	
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from product where productId = ?";
		
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1,productId);
		
		rs = pstmt.executeQuery();
		
		while(rs.next()){
		
	
	%>
	
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<h3><%=rs.getString("pname")%></h3>
				<p><%=rs.getString("description")%>
				<p>
				<b>상품코드:</b>
				<span class="badge badge-danger">
					<%=rs.getString("productId")%>
				</span>
				
				<p><b>제조사</b>:<%=rs.getString("manufacturer")%>
				<p><b>분류</b>:<%=rs.getString("category")%>
				<p><b>재고수</b>:<%=rs.getLong("unitsInStock")%>
				<h4><%=rs.getInt("unitPrice")%>원</h4>
				<p>
				<form name="addForm" action="./addCart.jsp?id=<%=rs.getString("productId")%>"
					  method="post">
				
					<a href="#" class="btn btn-info" onclick="addToCart()">상품주문&raquo;</a>
					<a href="cart.jsp" class="btn btn-warning">장바구니&raquo;</a>
					<a href="order.jsp" class="btn btn-info">상품목록&raquo;</a>
				</form>
			</div>
		</div>
	</div>
	<%
		}
	%>
	<jsp:include page="footer.jsp"/>
</body>
</html>






