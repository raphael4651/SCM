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
		MultipartRequest multi = new MultipartRequest(
			request, "C:\\upload", 5*1024*1024, "utf-8",
			new DefaultFileRenamePolicy()
		);
		
		//입력 폼의 속성이름(name으로 지정된 값)을 모두 가져온다.
		//type이 file인 속성이름은 가져오지않는다.
		Enumeration params = multi.getParameterNames();
		
		while (params.hasMoreElements()){
			String name = (String) params.nextElement();
			String value = multi.getParameter(name);
			out.println(name + " = " + value + "<br>");
		}
		out.println("-----------------------------------------<br>");
		
		//입력화면에서 type이 file인 속성의 이름을 가져온다.
		//Enumeration type(열거형)으로 반환
		Enumeration files = multi.getFileNames();
		
		
		//가져올 데이터가 있는지 체크
		while (files.hasMoreElements()){
			//true라면 값을 가져온다(nextElement())
			String name = (String) files.nextElement();
			//서버에 업로드 된 파일명
			String filename = multi.getFilesystemName(name);
			//원본 파일명
			String original = multi.getOriginalFileName(name);
			//문서 유형(MIME) 출력
			//이미지인 경우 image/jpeg, image/gif, image/jpg 등이 MIME
			String type = multi.getContentType(name);
			//업로드 파일명
			File file = multi.getFile(name);
			
			out.println("요청 파라미터 이름 : " + name + "<br>");
			out.println("실제 파일 이름 : " + original + "<br>");
			out.println("저장 파일 이름 : " + filename + "<br>");
			out.println("파일 콘텐츠 유형 : " + type + "<br>");
			
			if (file != null){
				out.println("파일 크기 : " + file.length());
				out.println("<br>");
			}
		}
	%>
</body>
</html>