<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String sessionId = (String) session.getAttribute("sessionId");
	%>

	<%@ include file = "../dbconn.jsp" %>

	<nav>	
	  <div>
	    <ul>
	     	<c:choose>
				<c:when test="${sessionId == 'admin'}">
				        <ul>		              
					      <li><a href="<c:url value="memberUpdate.jsp"/>">회원수정</a></li>			   
			              <li><a href="<c:url value="memberDelete.jsp"/>">회원삭제</a></li>
			              <li><a href="<c:url value="scheduleList.jsp"/>">스케줄리스트</a></li>
				          <li><a href="<c:url value="logout.jsp"/>">로그아웃 </a></li>
				        </ul> 
				</c:when>
				<c:when test="${sessionId != 'admin'}">
					<li><a href="<c:url value="memberUpdate.jsp"/>">회원수정</a></li>
					<li><a href="<c:url value="memberDelete.jsp"/>">회원삭제</a></li>
					<li><a href="<c:url value="logout.jsp"/>">로그아웃 </a></li>
				</c:when>	
			 </c:choose>
	    </ul>
	  </div>
	</nav>
</body>
</html>