<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Product"%>
<%@ include file="dbconn.jsp"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
</head>
<body>
	<%
		String id = request.getParameter("productId");
	
	 	if(id == null || id.trim().equals("")){
			response.sendRedirect("products.jsp");
			return;
		}
		
		ArrayList<Product> list = (ArrayList<Product>)session.getAttribute("cartList");
		
		if(list == null){
			list = new ArrayList<Product>();
			session.setAttribute("cartList",list);
		}
		
		//데이터베이스 접근
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int cnt = 0;
		Product goodsQnt = new Product();
		
		for(int i=0;i<list.size();i++){
			goodsQnt = list.get(i);
			
			//동일한 상품을 선택하면
			if(goodsQnt.getProductId().equals(id)){
				cnt++;
				int orderQuantity = goodsQnt.getQuantity() + 1;
				goodsQnt.setQuantity(orderQuantity);
			}
			
		}
		
		//장바구니에 처음으로 담긴 상품이면
		//수량을 1로 대입
		if(cnt == 0){
			
			try{
				
				Product goods = new Product();
				String sql = "select * from product where p_id = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,id);
				rs = pstmt.executeQuery();
				
				while(rs.next()){
					goods.setPname(rs.getString("p_name"));
					goods.setProductId(rs.getString("p_id"));
					goods.setUnitPrice(rs.getInt("p_unitPrice"));
					goods.setQuantity(1);
					
					list.add(goods);
				}
				
			}catch(SQLException e){
					out.println("addCart.jsp 오류<br>");
					out.println("SQLException:" + e.getMessage());
			}finally{
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}

		}
		
		response.sendRedirect("product.jsp?id=" + id);
	%>
</body>
</html>