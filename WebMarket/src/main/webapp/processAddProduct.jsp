<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>    
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	
		//page245
		String filename = "";
		String realFolder = "D:\\jspStudy\\WebMarket\\src\\main\\webapp\\resources\\images";
		int maxSize = 5 * 1024 * 1024;
		String encType = "utf-8";
		
		MultipartRequest multi = 
			new MultipartRequest(
				request,
				realFolder,
				maxSize,
				encType,
				new DefaultFileRenamePolicy());
	
	
		//request 내장객체를 이용하여
		//입력화면에서 입력한 값을 가져온다.
		String productId = multi.getParameter("productId");
		String name = multi.getParameter("name");
		String unitPrice = multi.getParameter("unitPrice");
		String description = multi.getParameter("description");
		String manufacturer = multi.getParameter("manufacturer");
		String category = multi.getParameter("category");
		String unitsInStock = multi.getParameter("unitsInStock");
		String condition = multi.getParameter("condition");
		
		Integer price;
		
		//단가는 숫자
		if(unitPrice.isEmpty()){
			price = 0;
		}else{
			//단가를 문자열에서 숫자로 변환처리
			price = Integer.parseInt(unitPrice);
		}
		
		long stock;
		
		if(unitsInStock.isEmpty()){
			stock = 0;
		}else{
			//문자열을 long타입으로 변환처리
			stock = Long.valueOf(unitsInStock);
		}
		
		
		//page246
		Enumeration files = multi.getFileNames();
		String fname = (String)files.nextElement();
		String fileName = multi.getFilesystemName(fname);
		
		PreparedStatement pstmt = null;
		
		String sql = "insert into product values(?,?,?,?,?,?,?,?,?)";
		
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1,productId);
		pstmt.setString(2,name);
		pstmt.setInt(3,price);
		pstmt.setString(4,description);
		pstmt.setString(5,category);
		pstmt.setString(6,manufacturer);
		pstmt.setLong(7,stock);
		pstmt.setString(8,condition);
		pstmt.setString(9,fileName);
		
		pstmt.executeUpdate();
		
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
		
		
		/* //싱글톤패턴으로 작성한 인스턴스 호출
		ProductRepository dao 
		     = ProductRepository.getInstance();
		
		//Product 클래스의 인스턴스를 Heap 메모리에
		//생성
		Product newProduct = new Product();
		
		newProduct.setProductId(productId);
		newProduct.setPname(name);
		newProduct.setUnitPrice(price);
		newProduct.setDescription(description);
		newProduct.setManufacturer(manufacturer);
		newProduct.setCategory(category);
		newProduct.setUnitsInStock(stock);
		newProduct.setCondition(condition);
		//page246
		newProduct.setFilename(fileName);
		
		
		//ArrayList에 추가
		dao.addProduct(newProduct); */
		
		//상품 리스트 화면으로 이동
		response.sendRedirect("products.jsp");
		
	%>
</body>
</html>



