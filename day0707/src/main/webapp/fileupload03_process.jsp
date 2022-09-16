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
		//서버의 파일 경로(업로드 될 위치) 지정
		String fileUploadPath = "C:\\upload";
		
		DiskFileUpload upload = new DiskFileUpload();
		
		//입력화면의 속성들을 가져와서 List구조의 변수(items)에 대입
		List items = upload.parseRequest(request);
		
		//Iterator: Collection 프레임워크에서 저장된 요소를 읽어오는 인터페이스
		//반복
		Iterator params = items.iterator();
		
		//다음에 가져올 요소가 있는지 체크 (True,False)
		while(params.hasNext()){
			
			//true일 때 다음 값을 가져온다.
			FileItem fileItem = (FileItem) params.next();
			
			//isFormField(): 입력화면에서 type이 file이 아닌 일반 속성이면
			//true 아니면 false
			//!fileItem.isFormField() 이므로 type이 file이 아니면 true이므로
			//지금은 file이므로 false값이 나오고 ! 로 인해서 true가 나온다
			if(!fileItem.isFormField()){
				String fileName = fileItem.getName();
				//파일 업로드시 주소 예시 d:\\test\\file\\test.jpg 형식
				//						1  2  3  4  5  6(예를들어 순서)							
				//lastIndexOf("\\") 제일 마지막 "\\"의 순서 5를 찾아서 +1
				//substring() 위의 제일마지막"\\"의 값의 +1이므로 제일 마지막 test.jpg
				// 즉 실제파일명만 추출하고 앞의 경로는 모두 버린다
				fileName = fileName.substring(fileName.lastIndexOf("\\") + 1);
				
				File file = new File(fileUploadPath + "/" + fileName);
				
				//서버 폴더에 업로드 파일 저장
				fileItem.write(file);
			}
		}
		out.println("정상적으로 파일 업로드");
	%>
	
	
</body>
</html>