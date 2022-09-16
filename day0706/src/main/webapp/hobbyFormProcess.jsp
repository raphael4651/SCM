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
	
		String hobbys[] = request.getParameterValues("hobby");
	%>
		선택하신 취미는
	<%	
		for(int i=0;i<hobbys.length;i++){
			//마지막 취미라면 바로 출력
			if(i == (hobbys.length-1)){
				out.println(hobbys[i]);
			//아니라면 ','를 출력
			}else{
				out.println(hobbys[i]+',');
			}
		}
	%>
		입니다.
</body>
</html>