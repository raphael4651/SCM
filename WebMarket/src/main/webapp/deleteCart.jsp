<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		//sessionId 값을 id 변수에 대입
		String id = request.getParameter("cartId");
	
		if(id == null || id.trim().equals("")){
			response.sendRedirect("cart.jsp");
			return;
		}
		
		//세션값을 모두 삭제
		session.invalidate();
		
		response.sendRedirect("cart.jsp");
	%>
</body>
</html>




