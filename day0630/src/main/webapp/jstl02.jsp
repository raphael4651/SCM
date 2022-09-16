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
<style>
	td {
		text-align:center; <!--가운데정렬 -->
	}
</style>
</head>
<body>
	<%--<c:set> : 변수선언 
	<c:out>:화면에 출력
	--%>
	<c:set var="name" value="홍길동" scope="page"/>
	<h2><c:out value="${name}"/></h2>
	
	<c:set var="num1" value="10"/>
	<c:set var="num2" value="20"/>
	<h2>합계:${num1 + num2}</h2>
	
	<c:set var="num" value="11"/>
	
	<c:if test="${num % 2 == 0}">
		<h2>${num}은 짝수</h2>
	</c:if>
	<c:if test="${num % 2 == 1}">
		<h2>${num}은 홀수</h2>
	</c:if>
	
	<!-- 조건문 -->
	<c:choose>
		<c:when test="${num % 2 == 0}">
			<h2>${num}은 짝수</h2>
		</c:when>
		<c:when test="${num % 2 == 1}">
			<h2>${num}은 홀수</h2>
		</c:when>
		<c:otherwise>
			<h2>숫자를 다시 입력하세요!</h2>
		</c:otherwise>	
	</c:choose>
	
	<%-- 반복문 --%>
	<c:forEach var="i" begin="1" end="10">
		<c:out value="${i}"/><br>
	</c:forEach>
	
	<%
		//현재페이지에서만 유효한 속성을 지정
		pageContext.setAttribute(
	    "fruit",new String[]{"사과","배","딸기"});
	%>
	
	<ul>
		<c:forEach var="name" items="${fruit}">
			<li>${name}</li>
		</c:forEach>
	</ul>
	
	<h2>문자열 분할</h2>
	<c:forTokens var="animal" 
	             items="말*기린*사자*호랑이"
	             delims="*">
		<c:out value="${animal}"/>	             
	</c:forTokens><br>
	
	숫자:
	<fmt:formatNumber value="12345.67" 
					  type="number"/><br>
    <fmt:formatNumber value="12345.67"
                      type="currency"/><br>
                      
    <c:set var="kor" value="94"/>                  
    <c:set var="eng" value="85"/>
    <c:set var="math" value="77"/>
    
    <fmt:formatNumber 
    	value="${(kor+eng+math)/3}"
    	pattern="###.#"/>
                      					  
	<%-- 날짜 --%>
	<c:set var="now"
		   value="<%=new Date()%>"/>
    
    현재일시:${now}
    
    날짜:<fmt:formatDate 
    		value="${now}" type="date"/><br>
    시간:<fmt:formatDate 
    		value="${now}" type="time"/><br>
    현재일시:
    <fmt:formatDate 
    		value="${now}" type="both"/>
    			
      <%-- 오라클 테이블 연동 테스트 --%>
      <%-- 오라클 데이터베이스 설정 선언 --%>
      <sql:setDataSource
      	var="con"
      	url="jdbc:oracle:thin:@localhost:1521:iot"
      	driver="oracle.jdbc.driver.OracleDriver"
      	user="test"
      	password="test1234"
      />					   
		
	  <%-- 
	  	부서 테이블의 데이터를 조회하여 rs 변수에 대입 
	  --%>	
	  <sql:query var="rs" dataSource="${con}">
	  	select * from dept order by deptno
	  </sql:query>
	
	  <table border="1">
	  	<tr>
	  		<th>부서코드</th>
	  		<th>부서명</th>
	  		<th>부서위치</th>
	  	</tr>
	  	<%-- 
	  		부서 테이블에서 한행씩 가져와서 변수 row에 대입 
	  	--%>
	  	<c:forEach var="row" items="${rs.rows}">
	  		<tr>
	  			<td>${row.deptno}</td>
	  			<td>${row.dname}</td>
	  			<td>${row.loc}</td>
	  		</tr>
	  	</c:forEach>
	  </table>	
</body>
</html>







