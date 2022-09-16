<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 국가별 통화,날짜 표기 --%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- 데이터베이스 연동 설정 --%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ page import="java.util.Date" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<sql:setDataSource
		var="con"
		driver="com.mysql.cj.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/WebMarketDB?serverTimezone=Asia/Seoul"
		user="shop"
		password="shop1234"/>	   
		
	  <%-- 
	  	부서 테이블의 데이터를 조회하여 rs 변수에 대입 
	  --%>	
	  <sql:query var="rs" dataSource="${con}">
	  	select * from membergrade
	  </sql:query>
	
	  <table border="1">
	  	<tr>
	  		<th>사원코드</th>
	  		<th>사원명</th>
	  		<th>등급</th>
	  	</tr>

	  	<c:forEach var="row" items="${rs.rows}">
	  		<tr>
	  			<td>${row.empno}</td>
	  			<td>${row.ename}</td>
	  			<td>
		  			<select>
						<option value="A" <c:if test="${row.grade eq 'A'}">selected</c:if>>A</option>
						<option value="B" <c:if test="${row.grade eq 'B'}">selected</c:if>>B</option>
						<option value="C" <c:if test="${row.grade eq 'C'}">selected</c:if>>C</option>
						<option value="S" <c:if test="${row.grade eq 'S'}">selected</c:if>>S</option>
					</select>
	  			</td>
	  		</tr>
	  	</c:forEach>
	  </table>	
</body>
</html>