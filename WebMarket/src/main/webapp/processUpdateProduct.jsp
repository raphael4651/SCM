<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		//상품 수정 페이지
		String filename = "";
		String realFolder = "D:\\jspStudy\\WebMarket\\src\\main\\webapp\\resources\\images";
		String encType = "utf-8";
		int maxSize = 5 * 1024 * 1024;
		
		//파일 업로드시 사용
		MultipartRequest multi = new MultipartRequest(request,realFolder,maxSize,encType,new DefaultFileRenamePolicy());
		
		String productId = multi.getParameter("productId");
		String name = multi.getParameter("name");
		String unitPrice = multi.getParameter("unitPrice");
		String description = multi.getParameter("description");
		String manufacturer = multi.getParameter("manufacturer");
		String category = multi.getParameter("category");
		String unitsInStock = multi.getParameter("unitsInStock");
		String condition = multi.getParameter("condition");
		
		Integer price;
		
		if(unitPrice.isEmpty()){
			price = 0;
		}else{
			price = Integer.valueOf(unitPrice);
		}
		
		
		long stock;
		
		if(unitsInStock.isEmpty()){
			stock = 0;
		}else{
			stock = Integer.valueOf(unitsInStock);
		}
		
		Enumeration files = multi.getFileNames();
		
		String fname = (String)files.nextElement();
		String fileName = multi.getFilesystemName(fname);
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		//상품 수정을 하기 위해 해당 상품 정보를 가져온다.
		String sql = "select * from product where p_id = ?";
		
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1,productId);
		
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			
			//상품수정시 파일업로드를 하는 경우
			if(fileName != null){
				sql = "update product" +
			          "   set p_name=?," +
			          "       p_unitPrice=?," +
			          "       p_description=?," +
			          "       p_manufacturer=?," +
			          "       p_category=?," +
			          "       p_unitsInStock=?," +
			          "       p_condition=?," +
			          "       p_fileName=?" +
			          " where p_id=?";
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1,name);
				pstmt.setInt(2,price);
				pstmt.setString(3,description);
				pstmt.setString(4,manufacturer);
				pstmt.setString(5,category);
				pstmt.setLong(6,stock);
				pstmt.setString(7,condition);
				pstmt.setString(8,fileName);
				pstmt.setString(9,productId);
				
				pstmt.executeUpdate();
				
			}else{//상품수정시 파일 업로드를 하지 않는 경우
				sql = "update product" +
				          "   set p_name=?," +
				          "       p_unitPrice=?," +
				          "       p_description=?," +
				          "       p_manufacturer=?," +
				          "       p_category=?," +
				          "       p_unitsInStock=?," +
				          "       p_condition=?" +
				          " where p_id=?";
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1,name);
				pstmt.setInt(2,price);
				pstmt.setString(3,description);
				pstmt.setString(4,manufacturer);
				pstmt.setString(5,category);
				pstmt.setLong(6,stock);
				pstmt.setString(7,condition);
				pstmt.setString(8,productId);
				
				pstmt.executeUpdate();
				
			}
		}
		
		
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
		
		response.sendRedirect("editProduct.jsp?edit=update");
	%>
</body>
</html>