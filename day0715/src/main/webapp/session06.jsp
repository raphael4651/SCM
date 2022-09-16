<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4>----- 세션을 삭제하기 전 -----</h4>
	
	<%
		String user_id = (String)session.getAttribute("userID");
		String user_pw = (String)session.getAttribute("userPW");
		
		out.println("설정된 세션 이름 userID : " + user_id + "<br>");
		out.println("설정된 세션 값 userPW : " + user_pw + "<br>");
		
		//isRequestedSessionIdValid()
		//클라이언트 요청시 헤더에 포함된 sessionId 값이 유효하면 true 아니면 false
		//Valid:유효한
		if(request.isRequestedSessionIdValid() == true){
			out.print("세션이 유효합니다.");
		}else{
			out.print("세션이 유효하지 않습니다.");
		}
		
		//세션에 지정된 모든 세션정보를 삭제
		session.invalidate();
	%>
	
	<h4>----- 세션을 삭제한 후 -----</h4>
	
	<%
		if(request.isRequestedSessionIdValid() == true){
			out.print("세션이 유효합니다.");
		}else{
			out.print("세션이 유효하지 않습니다.");
		}
	%>
</body>
</html>