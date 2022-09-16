<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function checkValue(){
		var sno = document.getElementById("sno").value;
		var sname = document.getElementById("sname").value;
		var kor = document.getElementById("kor").value;
		var eng = document.getElementById("eng").value;
		var math = document.getElementById("math").value;
		
		if(!sno){
			alert("학생번호를 입력하세요!");
			return false;
		}
		
		if(!sname){
			alert("학생이름을 입력하세요!");
			return false;
		}
		
		if(!kor){
			alert("국어성적을 입력하세요!");
			return false;
		}
		
		if(!eng){
			alert("영어성적을 입력하세요!");
			return false;
		}
		
		if(!math){
			alert("수학성적을 입력하세요!");
			return false;
		}
		
		document.frm.submit();
	}
</script>
</head>
<body>
	<form name="frm" 
		  action="score_process.jsp" 
		  method="post">
		<p>학생번호 : <input type="text" id="sno" name="sno">
		<p>학생이름 : <input type="text" id="sname" name="sname">
		<p>국어 : <input type="text" id="kor" name="kor">
		<p>영어 : <input type="text" id="eng" name="eng">
		<p>수학 : <input type="text" id="math" name="math">
		<p><input type="button" value="전송" onclick="checkValue()">
	</form>
</body>
</html>







