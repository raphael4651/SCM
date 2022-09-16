<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		//입력받은 한글 깨짐 방지 선언
		request.setCharacterEncoding("utf-8");
	%>
	
	<%-- 자바빈즈 기법을 사용한다는 선언 --%>
	<jsp:useBean id="member" class="beans.Member" />
	
	<%-- 화면에서 입력받은 속성값을 클래스의 필드에 대입 선언(Mapping) --%>
	<jsp:setProperty name="member" property="id" />
	<jsp:setProperty name="member" property="passwd" />
	<jsp:setProperty name="member" property="name" />
	<jsp:setProperty name="member" property="phone" />
	
	<%-- 클래스의 필드값을 출력 --%>
	<h2>회원정보</h2>
	아이디:<jsp:getProperty name="member" property="id" /><br>
	비밀번호:<jsp:getProperty name="member" property="passwd" /><br>
	이름:<jsp:getProperty name="member" property="name" /><br>
	연락처:<jsp:getProperty name="member" property="phone" />

</body>
</html>