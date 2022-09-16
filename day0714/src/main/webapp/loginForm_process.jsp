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
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		
		String msg;
		
		if(id.equals("admin") && 
   		   passwd.equals("admin1234")){
			
		   //정상적으로 로그인시 세션값을 지정	
		   session.setAttribute("userID","admin");

		   msg = "로그인 성공";
		   
		}else{//로그인 실패
			msg = "로그인 실패";	
		}
	%>
	
	<%=msg%>
</body>
</html>







