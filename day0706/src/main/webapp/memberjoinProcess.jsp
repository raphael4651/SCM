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
	
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String id = request.getParameter("id");
		String passwd1 = request.getParameter("passwd1");
		String passwd2 = request.getParameter("passwd2");
		String postCd = request.getParameter("postCd");
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		String email = request.getParameter("email1") + '@' 
						+ request.getParameter("email2");
		String phone = request.getParameter("phone");
		
		//hobby는 여러개를 선택하여 값이 여러개이므로 배열구조로 가져온다.
		String hobbys[] = request.getParameterValues("hobby");
		
		String greeting = request.getParameter("greeting");
		
		out.println("이름:" + name + "<br>");
		out.println("성별:" + gender + "<br>");
		out.println("아이디:" + id + "<br>");
		out.println("비밀번호:" + passwd1 + "<br>");
		out.println("우편번호:" + postCd);
		out.println(addr1 + "<br>");
		out.println(addr2 + "<br>");
		out.println("이메일:" + email + "<br>");
		out.println("전화번호:" + phone + "<br>");
		out.println("취미:");
		
		//향상된 for 문
		//hobbys의 배열에 있는 값을 순서대로 가져와서 value에 대입한다.
		for(String value : hobbys){
			out.println(value + " ");
		}

		out.println("<br>자기소개:" + greeting + "<br>");
	%>
</body>
</html>