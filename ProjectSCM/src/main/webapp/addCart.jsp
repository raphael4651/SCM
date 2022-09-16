<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Product" %>    
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="dbconn.jsp" %>
	
	<% 
		String id = request.getParameter("productId");
		
			if(id == null || id.trim().equals("")){
				response.sendRedirect("order.jsp");
				return;
			}
		
		ArrayList<Product> list = (ArrayList<Product>)session.getAttribute("cartList");
		
			if(list == null){
				list = new ArrayList<Product>();
				session.setAttribute("cartList", list);
			}
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int cnt = 0;
		Product goodsQnt = new Product();
		
		for(int i=0;i<list.size();i++){
			goodsQnt = list.get(i);
			
			if(goodsQnt.getProductId().equals(id)){
				cnt++;
				int orderQuantity = goodsQnt.getQuantity() + 1;
				goodsQnt.setQuantity(orderQuantity);
			}
		}
		
		if(cnt == 0){
			try{
				Product goods = new Product();
				String sql = "select * from product where productId=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				
				while(rs.next()){
					goods.setProductId(rs.getString("productId"));
					goods.setPname(rs.getString("pname"));
					goods.setUnitPrice(rs.getInt("unitPrice"));
					goods.setQuantity(1);
					
					list.add(goods);
				}
			}catch(SQLException e){					
					out.println("SQLException:" + e.getMessage());
			}finally{
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}
		}
		
		response.sendRedirect("order.jsp");
		
		
	%>


</body>
</html>