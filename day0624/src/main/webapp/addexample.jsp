<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%!
		int total = 0;			//총계변수 초기화
		
	    public int add(){
			
			for(int i=1;i<=100;i++){
				total += i;
			}
			
			return total;
		}
	%>
	
	<p>1부터 100까지 합계:<%=add()%></p>
	


</body>
</html>