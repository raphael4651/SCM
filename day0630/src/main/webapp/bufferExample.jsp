<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page buffer = "1kb" autoFlush="true" %>
<%@ page info = "이 예제는 버퍼 활용 예제입니다." %>
<%-- buffer의 크기를 1kb로 하고 자동출력을 false --%>
<%-- autoFlush가 false인경우 buffer의 크기가 내용의 크기보다 작으면 오버플로우 에러 --%>
<%-- autoFlush를 true로 하면 buffer에 데이터가 들어오면 바로바로 나가므로 오버플로우에러가 나지않는다. --%>
<%-- info는 이 페이지에 설명을 달아 놓는 용도로 사용한다. --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%-- 1234 : 4byte 이며 for문으로 1000번을 돌면 4kb가 필요한 상황 --%>
	<%
		for(int i=1;i<=1000;i++){
	%>
			1234
	<%
		}
	%>

</body>
</html>