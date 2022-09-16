<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="dto.Product" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">	
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
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
	<%@ include file = "menu.jsp" %>

	<div>
		<div><h1>제품주문</h1></div>
			
		<table class="table table-hover">
			<thead>
			<tr>
				<th scope="col">제품아이디</th>
				<th scope="col">상품명</th>
				<th scope="col">타입</th>
				<th scope="col">분류</th>
				<th scope="col">제조사</th>
				<th scope="col">단가</th>
				<th scope="col">상품설명</th>
				<th scope="col">재고수량</th>
				<th scope="col">등록시간</th>
				<th scope="col">제품주문</th>
				<th scope="col">장바구니</th>
			</tr>
			</thead>
			
			<tbody>
			
			<%
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				try{
					String sql = "select * from product";
					
					pstmt = conn.prepareStatement(sql);
					
					rs = pstmt.executeQuery();
					
					while(rs.next()){
						String productId = rs.getString("productId");
						String pname = rs.getString("pname");
						String type = rs.getString("type");
						String category = rs.getString("category");
						String manufacturer = rs.getString("manufacturer");
						String unitPrice = rs.getString("unitPrice");
						String description = rs.getString("description");
						String unitsInStock = rs.getString("unitsInStock");
						String regdate = rs.getString("regdate");
			%>
			
				<tr>
					<td scope="row"><%=productId%></td>
					<td scope="row"><%=pname%></td>
					<td scope="row"><%=type%></td>
					<td scope="row"><%=category%></td>
					<td scope="row"><%=manufacturer%></td>
					<td scope="row"><%=unitPrice%></td>
					<td scope="row"><%=description%></td>
					<td scope="row"><%=unitsInStock%></td>
					<td scope="row"><%=regdate%></td>
					
					<td scope="row">
						<form name="addForm" action="addCart.jsp?productId=<%=productId%>" method="post">
							<a href="#" onclick="addToCart()">주문</a>
						</form>
					</td>	
					<td scope="row"><a href="cart.jsp">장바구니</a></td>
				</tr>		
			<%
					}
				}catch(SQLException e){
					out.println("SQLException : " + e);
				}finally{
					try{
						if(rs != null) rs.close();
						if(pstmt != null) pstmt.close();
						if(conn != null) conn.close();
					}catch(SQLException e){
						out.println("SQLException : " + e);
					}
				}
			%>
			</tbody>
		</table>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>