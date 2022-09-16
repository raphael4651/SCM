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
		request.setCharacterEncoding("utf-8");
	
		String fruits[] = request.getParameterValues("fruit");
	%>
	
	선택한 과일 <br>
	
	<%
	/*for(int i=0; i<fruits.length; i++){
		out.print(fruits[i] + " ");
	}
	향상된 for문 */
	 for (String value : fruits){
		out.println(value + " ");
	} 
	%>
</body>
</html>