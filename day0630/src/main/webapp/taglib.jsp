<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%-- prefix(접두어)를 c로 정의 uri로 해서 core를 다운 --%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- forEach 반복문 --%>
	<%-- var(변수)를 k로 하고 1부터 10까지 1씩 증가 --%>
	<c:forEach var="k" begin="1" end="10" step="1">
	    현재 i값은 
		<c:out value="${k}"/>
	</c:forEach>
	<%-- ${변수,조건식등} 은 EL(표현언어)(Expression Language)라고한다 --%>
	<br>
	<%-- 위의 c:forEach와 밑의 for문은 똑같은 식이나 가독성이 위가 좋다. --%>
	<%
		for(int i=1;i<=10;i++){
    %>		
			현재 i값은
	<%		
			out.println(i);
		}
	%>

</body>
</html>






