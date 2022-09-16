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
		int total = 0;
	
		public int add(){
			
			for(int i=1;i<=1000;i++){
				
				if((i%3 == 0) || (i%5 == 0)){
					total += i;
				}
			};
			
			return total;
		}
	%>
	
	<p>합계:<%=add()%></p>

</body>
</html>