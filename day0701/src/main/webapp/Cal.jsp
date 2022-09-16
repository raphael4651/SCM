<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function num2Check(){
		var num2 = 
		document.getElementById("num2").value;
		
		if(num2 == 0){
			alert("분모는 0로 나눌수 없습니다!");
			return;
		}
		
		//정상적일때 submit
		frm.submit();
		
	}
</script>
</head>
<body>
	<form name="frm" action="CalProcess.jsp" method="post">
		<input type="text" name="num1">
		<select name="op">
			<option selected>+</option>
			<option>-</option>
			<option>*</option>
			<option>/</option>
		</select>
		<input type="text" name="num2" id="num2">
		<br>
		<input type="button" 
		       value="계산" 
		       onclick="num2Check()">
	</form>
</body>
</html>







