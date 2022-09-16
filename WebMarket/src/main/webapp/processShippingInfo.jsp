<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	
		//쿠키 생성
		//URLEncoder.encode()?
		//인코딩(encoding)?
		//문자열을 컴퓨터가 인식하는 바이트단위로 변환		
		//디코딩(decoding)?
		//바이트단위문자를 문자열로 복원		
		//입력값이 한글일 경우 깨짐 방지		
		Cookie cartId = new Cookie("Shipping_cartId",URLEncoder.encode(request.getParameter("cartId"),"utf-8"));
		Cookie name = new Cookie("Shipping_name",URLEncoder.encode(request.getParameter("name"),"utf-8"));
		Cookie shippingDate = new Cookie("Shipping_shippingDate",URLEncoder.encode(request.getParameter("shippingDate"),"utf-8"));
		Cookie country = new Cookie("Shipping_country",URLEncoder.encode(request.getParameter("country"),"utf-8"));
		Cookie zipCode = new Cookie("Shipping_zipCode",URLEncoder.encode(request.getParameter("zipCode"),"utf-8"));
		Cookie addressName = new Cookie("Shipping_addressName",URLEncoder.encode(request.getParameter("addressName"),"utf-8"));
		Cookie addressName2 = new Cookie("Shipping_addressName2",URLEncoder.encode(request.getParameter("addressName2"),"utf-8"));
	
		//쿠키 유효시간 설정(24시간)
		cartId.setMaxAge(24 * 60 * 60);
		name.setMaxAge(24 * 60 * 60);
		shippingDate.setMaxAge(24 * 60 * 60);
		country.setMaxAge(24 * 60 * 60);
		zipCode.setMaxAge(24 * 60 * 60);
		addressName.setMaxAge(24 * 60 * 60);
		addressName2.setMaxAge(24 * 60 * 60);
		
		//서버에서 클라이언트로 쿠키 전송처리
		response.addCookie(cartId);
		response.addCookie(name);
		response.addCookie(shippingDate);
		response.addCookie(country);
		response.addCookie(zipCode);
		response.addCookie(addressName);
		response.addCookie(addressName2);
		
		//주문 정보 페이지로 이동
		response.sendRedirect("orderConfirmation.jsp");
	
	%>
</body>
</html>







