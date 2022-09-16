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
		String pageUrl = null;//변수 초기화
		
		//forward.jsp에서 선택한 값을 가져온다.
		String selectCode = 
		     request.getParameter("code");
	
		//선택한 값으로 jsp 이동
	    if(selectCode.equals("A")){
	    	pageUrl = "a.jsp";
	    }else if (selectCode.equals("B")){
	    	pageUrl = "b.jsp";
	    }else if (selectCode.equals("C")){
	    	pageUrl = "c.jsp";
	    }
	%>
	
	<%-- 
		forward.jsp에서 선택한 jsp로 이동 
	--%>
	<jsp:forward page="<%=pageUrl%>"/>
	
</body>
</html>






