<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>    
<%@ page import="java.io.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		//웹페이지에서 서버로 파일을 업로드하는 것을
		//처리하는 클래스
		//5개 매개변수
		//1.request 객체
		//2.업로드 위치
		//3.업로드 파일의 크기
		//4.인코딩 방식
		//5.동일한 파일 업로드 처리방법 선언
		MultipartRequest multi = 
		    new MultipartRequest(
		    		request,
		    		"c:\\upload",
		    		5*1024*1024,
		    		"utf-8",
		    		new DefaultFileRenamePolicy());
	
		String title = multi.getParameter("title");
		out.println("<h3>" + title + "</h3>");
		
		//type이 file인 속성값을 가져온다.
		Enumeration files = multi.getFileNames();
		String name = (String)files.nextElement();
		
		//서버에 전송된 파일 이름
		String filename = multi.getFilesystemName(name);
		
		//업로드하기전 원본파일명
		String original = multi.getOriginalFileName(name);
		
		out.println("실제 파일 이름:" + original + "<br>");
		out.println("저장 파일 이름:" + filename);
	%>
</body>
</html>



