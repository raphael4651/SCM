<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.fileupload.*" %>
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
		String path = "C:\\upload";
	
		DiskFileUpload upload = new DiskFileUpload();
		
		//setSizeMax: 업로드 파일 최대 크기(1M)(1000000)
		upload.setSizeMax(1000000);
		//setSizeThreshold: 메모리버퍼 크기 지정 4096byte보다 작은 파일은 메모리에 저장
		upload.setSizeThreshold(4096);
		//setRepositoryPath: 4096byte보다 큰 파일은 path의 임시폴더에 저장
		upload.setRepositoryPath(path);
		//업로드 파일 크기가 4096byte 이하이면 메모리에서 업로드 처리하고
		//4096바이트가 넘으면 setRepositoryPath()에서 지정한 폴더에서 임시로 업로드 처리
		
		List items = upload.parseRequest(request);
		
		Iterator params = items.iterator();
		
		while (params.hasNext()){
			FileItem item = (FileItem)params.next();
			
			if(item.isFormField()){
				String name = item.getFieldName();
				String value = item.getString("utf-8");
				out.println(name + "=" + value + "<br>");	
			}else{
				String fileFieldName = item.getFieldName();
				String fileName = item.getName();
				String contentType = item.getContentType();
				
				fileName = fileName.substring(fileName.lastIndexOf("\\")+1);
				long fileSize = item.getSize();
				
				File file = new File(path + "/" + fileName);
				item.write(file);
				
				out.println("---------------------------------<br>");
				out.println("요청 파라미터 이름 : " + fileFieldName + "<br>");
				out.println("저장 파일 이름 : " + fileName + "<br>");
				out.println("파일 콘텐츠 유형 : " + contentType + "<br>");
				out.println("파일 크기 : " + fileSize);
			}
		}
	%>
</body>
</html>