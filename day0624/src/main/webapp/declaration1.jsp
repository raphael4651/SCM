<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Scripting Tag</title>
</head>
<body>
	Page Count is:
	
	<%-- 스크립틀릿 태그(scriptlet tag) --%>
	<%
		/* 스크립틀릿 태그는 Java 소스 */	
		out.print(myMethod(0));
		// myMethod()를 호출할 때 0값을 보낸 후 화면에 출력한다.
	%>
	
	<%-- 선언문 태그(declaration tag) 
		int : Return type
	--%>
	<%!
		public int myMethod(int count){
			return ++count;
		}
	%>
</body>
</html>