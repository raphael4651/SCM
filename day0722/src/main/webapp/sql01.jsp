<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%-- 데이터베이스 연결 설정 --%>
	<sql:setDataSource
		var="dataSource"
		url="jdbc:mysql://localhost:3307/exercisedb?serverTimezone=Asia/Seoul"
		driver="com.mysql.cj.jdbc.Driver"
		user="jsp"
		password="jsp1234"/>
	
	<%-- 
		select 문을 실행시 선언
		dataSource 에 선언된 데이터베이스 연결을
	    해서 select문을 수행후 변수 resultSet에	
	    대입
	--%>	
	<sql:query var="resultSet"
			   dataSource="${dataSource}">
		select * from member	   
	</sql:query>
	
	<table border="1">
		<tr>
			<%-- 
				반복문
				resultSet.columnNames?
				테이블의 컬럼명을 가져온다.
			--%>
			<c:forEach var="columnName" items="${resultSet.columnNames}">
				<th width="100">
					<c:out value="${columnName}"/>
				</th>
			</c:forEach>
		</tr>
		
		<c:forEach var="row" 
		        items="${resultSet.rowsByIndex}">
			<tr>
				<%-- varStatus:행의 상태값 --%>
				<c:forEach var="column" items="${row}" varStatus="i">
					<td>
				
						<c:if test="${column != null}">
							<c:out value="${column}"/>
						</c:if>
						
						<c:if test="${column == null}">
							&nbsp;
						</c:if>
					</td>
				</c:forEach>
			</tr>
		
		</c:forEach>
	</table>
	
	<br>
	
	<table border="1">
	
	    <tr>
	    	<th>일련번호</th>
	    	<th>아이디</th>
	    	<th>비밀번호</th>
	    	<th>이름</th>
	    </tr>
	
		<tr>
			
		<%-- 
			resultSet.rows:select문을
			수행후 리턴되는 모든 행
		 --%>	
		<c:forEach var="row" 
  		           items="${resultSet.rows}"
  		           varStatus="i">
			<tr>
					<td>
						<%-- 1부터 자동 넘버링 --%>
						<c:out value="${i.count}"/>
					</td>
					<td>
						<c:out value="${row.id}"/>
					</td>
					<td>	
						<c:out value="${row.passwd}"/>
					</td>
					<td>	
						<c:out value="${row.name}"/>
					</td>
			</tr>
		
		</c:forEach>
	</table>			
</body>
</html>