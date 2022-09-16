<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품수정</title>
<script src="./resources/js/validation.js"></script>
</head>
<body>

	
	<fmt:setLocale value='<%=request.getParameter("language")%>'/>
	
	<fmt:bundle basename="bundle.message">
	
	<%@ include file="menu.jsp" %>
	
	<%
		String productId = request.getParameter("productId");
	
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    
	    try{
	    	String sql = "select * from product where productId=?";
	    	
	    	pstmt = conn.prepareStatement(sql);
	    	
	    	pstmt.setString(1, productId);
	    	
	    	rs = pstmt.executeQuery();
	    	
	    	if(rs.next()){
				String pname = rs.getString("pname");
				String type = rs.getString("type");
				String category = rs.getString("category");
				String manufacturer = rs.getString("manufacturer");
				String unitPrice = rs.getString("unitPrice");
				String description = rs.getString("description");
				String unitsInStock = rs.getString("unitsInStock");
				String regdate = rs.getString("regdate");
	%>
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">제품 수정</h1>
		</div>
	</div>
	
	<div class="container">
	
		<div class="display-5 text-right">
			<a href="?language=ko">한국어</a>|
			<a href="?language=en">영어</a>
		</div>
	
		<form name="newProduct" action="updateProductProcess.jsp" class="form-horizontal" method="post">
		      
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="productId"/></label>
				<div class="col-sm-3">
					<input type="text" id="productId" name="productId" class="form-control" value="<%=productId%>">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="pname"/></label>
				<div class="col-sm-3">
					<input type="text" id="pname" name="pname" class="form-control" value="<%=pname%>">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="unitPrice"/></label>
				<div class="col-sm-3">
					<input type="text" id="unitPrice" name="unitPrice" class="form-control" value="<%=unitPrice%>">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="description"/></label>
				<div class="col-sm-5">
					<textarea name="description" cols="50" rows="2" class="form-control" ><%=description%></textarea>
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="manufacturer"/></label>
				<div class="col-sm-3">
					<input type="text" name="manufacturer" class="form-control" value="<%=manufacturer%>">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="category"/></label>
				<div class="col-sm-3">
					<input type="text" name="category" class="form-control" value="<%=category%>">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="type"/></label>
				<div class="col-sm-3">
					<input type="text" id="type" name="type" class="form-control" value="<%=type%>">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="unitsInStock"/></label>
				<div class="col-sm-3">
					<input type="text" id="unitsInStock" name="unitsInStock" class="form-control" value="<%=unitsInStock%>">
				</div>
			</div>
			
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="button" class="btn btn-primary" value="수정"
					       onclick="CheckAddProduct();">
				</div>
			</div>	
		</form>
	</div>
		<%
	    	}
	    }catch(SQLException e){
	    	out.println("SQLException : " + e);
	    }finally{
	    	try{
	    		if(rs != null) rs.close();
	    		if(pstmt != null) pstmt.close();
	    		if(conn != null) pstmt.close();
	    	}catch(SQLException e){
		    	out.println("SQLException : " + e);
	    	}
	    }
	%>
</fmt:bundle>
<jsp:include page="footer.jsp"/>	
</body>
</html>