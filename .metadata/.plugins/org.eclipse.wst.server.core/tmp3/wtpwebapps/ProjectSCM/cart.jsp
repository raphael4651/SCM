<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function checkOrder(){
		<%
		  ArrayList list = (ArrayList<Product>)session.getAttribute("cartList");

		  if(list == null || list.size() == 0){
		%>
			  alert("선택하신 상품내역이 없습니다!");
			  location.href = 'cart.jsp';
			  return false;
		<%
		   }	
		%>
		return true;
	}
</script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(document).ready(function(){

	$(".qtyUp,.qtyDown").click(function(){
    	
        var qtyUp = $(this);
        var tr = qtyUp.parent().parent();//tr
        var td = tr.children();//td
        var rowNum = tr.index()+1;//현재행
        var pid = td.eq(0).text().split('-')[0];//상품코드
        var price = Number(td.eq(1).text());//가격
        
        if($(this).hasClass('qtyUp')){
        	var qty = Number(td.children("input.qty").val())+1;
        }else{
        	var qty = Number(td.children("input.qty").val())-1;
        }

        $(this).parent().parent().children("td").children("input.qty").val(qty);
      
        document.cartQtyUpdate.pcode.value=pid;  
		document.cartQtyUpdate.qty.value=qty; 
		
		document.cartQtyUpdate.submit();

	    });
	});  
</script>
</head>
<body>
	<%
		String cartId = session.getId();
	%>
	
	<%@ include file = "menu.jsp" %>
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">장바구니</h1>
		</div>
	</div>
	
	<div class="container">
		<div class="row">
			<table width="100%">
				<tr>
					<td align="left"><a href="./deleteCart.jsp?cartId=<%=cartId%>" class="btn btn-danger">삭제하기</a></td>
					<td align="right">
					<a href="./shippingInfo.jsp?cartId=<%=cartId%>"
					   onclick="return checkOrder()" 
					   class="btn btn-primary">주문하기</a></td>
				</tr>
			</table>	
		</div>
		
		<div style="padding-top:50px">
			<table id="cart" class="table table-hover">
				<tbody id="test_tbody">
				<tr>
					<th class="text-center col-sm-4">상품</th>
					<th class="text-center col-sm-2">가격</th>
					<th class="text-center col-sm-2">수량</th>
					<th class="text-right col-sm-2">소계</th>
					<th class="text-center col-sm-2">비고</th>
				</tr>
				<%
					int sum = 0;
					ArrayList<Product> cartList = (ArrayList<Product>)session.getAttribute("cartList");
					
					if(cartList == null){
						cartList = new ArrayList<Product>();
					}
					
					//total : 소계를 계산
					//sum : 총계
					for(int i=0;i<cartList.size();i++){
						Product product = cartList.get(i);
						int total = product.getUnitPrice()*product.getQuantity();
						sum += total;
				%>
				
				<tr class="tr_this">
					<td><%=product.getProductId()%>-<%=product.getPname()%></td>
					<td class="text-center col-sm-2"><fmt:formatNumber value="<%=product.getUnitPrice()%>"/></td>
					<td>
						<input style="text-align:center" readonly type="text" size="2" name="qty" class="qty" value="<%=product.getQuantity()%>" />
					    &nbsp;&nbsp;
					    <i class="fa fa-arrow-circle-up fa-lg qtyUp" style="color:blue"></i>
					    &nbsp;&nbsp;
					    <i class="fa fa-arrow-circle-down fa-lg qtyDown" style="color:red"></i>
				
					</td>
					<td class="text-right col-sm-2 subamt"><fmt:formatNumber value="<%=total%>"/></td>
					<td class="text-center col-sm-2"><a href="./removeCart.jsp?id=<%=product.getProductId()%>" class="badge badge-danger">삭제</a></td>
				</tr>
				<%
					}
				%>
				
				<tr>
					<th></th>
					<th></th>
					<th class="text-right">총액</th>
					<th class="text-right sumamt"><fmt:formatNumber value="<%=sum%>"/></th>
					<th></th>
				</tr>
				</tbody>
			</table>
			<a href="order.jsp" class="btn btn-warning">&laquo;쇼핑 계속하기</a>
		</div>
		<hr>
	</div>
	
	<jsp:include page="footer.jsp"/>
	
	<form id="cartQtyUpdate" name="cartQtyUpdate" action="cartUpdate.jsp" method="post">
		<input type="hidden" name="pcode">
		<input type="hidden" name="qty">
	</form>
	
	<jsp:include page="footer.jsp"/>
</body>
</html>