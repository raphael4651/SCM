<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
	table {
		border:1px solid #000;
		border-collapse: collapse;
		width:600px;
	}
	
	tr,td {
		border:1px solid #000;
	}
</style>
<script>
	function postSerch(){
		 new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var roadAddr = data.roadAddress; // 도로명 주소 변수
	                var extraRoadAddr = ''; // 참고 항목 변수

	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraRoadAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraRoadAddr !== ''){
	                    extraRoadAddr = ' (' + extraRoadAddr + ')';
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById("postCd").value = data.zonecode;
	                document.getElementById("addr1").value = roadAddr;
	                document.getElementById("addr1").value = data.jibunAddress;
	                
	                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
	                if(roadAddr !== ''){
	                    document.getElementById("addr2").value = extraRoadAddr;
	                } else {
	                    document.getElementById("addr2").value = '';
	                }

	                var guideTextBox = document.getElementById("guide");
	                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
	                if(data.autoRoadAddress) {
	                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
	                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
	                    guideTextBox.style.display = 'block';

	                } else if(data.autoJibunAddress) {
	                    var expJibunAddr = data.autoJibunAddress;
	                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
	                    guideTextBox.style.display = 'block';
	                } else {
	                    guideTextBox.innerHTML = '';
	                    guideTextBox.style.display = 'none';
	                }
	            }
	        }).open();
	}
	
	
	//유효성 검사
	//사용자가 폼 페이지에서 입력한 값이 서버로 전송 되기전 특정 규칙에 맞게 입력되었는지 
	//체크하는 것
	//사용자가 부적합한 값을 입력시 다시 입력하도록 사용자에게 알려주는 것
	function checkValue(){
		//getElementById?
		//input 태그에 id로 지정한 속성의 값을 가져온다.
		//required와의 차이점
		//알림창이 뜨기때문에 고객이 알아보기가 훨씬 쉽다.
		//placeholder 까지 사용해서 고객지향적인 사이트를 만들면 좋다.
		
		var name = document.getElementById("name").value;
		var id = document.getElementById("id").value;
		var passwd1 = document.getElementById("passwd1").value;
		var passwd2 = document.getElementById("passwd2").value;
		var addr1 = document.getElementById("addr1").value;
		var addr2 = document.getElementById("addr2").value;
		var email1 = document.getElementById("email1").value;
		var email2 = document.getElementById("email2").value;
		var phone = document.getElementById("phone").value;
		var hobby = document.getElementById("hobby").value;
		var greeting = document.getElementById("greeting").value;
		
		
		//!name name이 null 혹은 공백 혹은 undefined 등등
		if(!name){
			alert('이름을 입력하세요!');
			return false;
		}
		if(!id){
			alert('아이디를 입력하세요!');
			return false;
		}
		if(!passwd1){
			alert('비밀번호를 입력하세요!');
			return false;
		}			
		if(!passwd2){
			alert('비밀번호 재입력을 입력하세요!');
			return false;	
		}			  
		if(!addr1){
			alert('주소를 입력하세요!');
			return false;
		}		
		if(!addr2){
			alert('상세주소를 입력하세요!');
			return false;
		}	
		if(!email1){
			alert('이메일을 입력하세요!');
			return false;	
		}	
		if(!email2){
			alert('이메일 뒷자리를 입력하세요!');
			return false;
		}	
		if(!phone){
			alert('전화번호를 입력하세요!');
			return false;
		}	
		
		//취미 선택여부 체크
		/* var is_checked = hobby.checked;
		
		if(!is_checked){
			alert('취미를 선택하세요!');
			return false;	
		}	 */	
		
		if(!greeting){
			alert('자기소개를 입력하세요!');
			return false;	
		}				
			
		document.frm.submit();
	}
</script>
</head>
<body>
	<form name="frm" action="memberjoinProcess.jsp" method="post">
		<table align=center>
			<caption>회원가입</caption>
			<tr>
				<td>이름</td>
				<td>
					<input type="text" name="name" id="name" placeholder="이름을 입력하세요">
				</td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
					<input type="radio" name="gender" value="남" id="gender">남
					<input type="radio" name="gender" value="여" id="gender">여
				</td>
				<%-- radio의 경우 같은 계열의 선택에서는 name을 동일하게 해야한다. --%>
			</tr>
			<tr>
				<td>아이디</td>
				<td>
					<input type="text" name="id" id="id">
					<input type="button" value="중복확인">
				</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td>
					<input type="password" name="passwd1" id="passwd1">
				</td>
			</tr>
			<tr>
				<td>비밀번호 재입력</td>
				<td>
					<input type="password" name="passwd2" id="passwd2">
				</td>
			</tr>
			<tr>
				<td>주소</td>
				<td>
					<input type="text" name="postCd" id="postCd" readonly="readonly">
					<input type="text" name="addr1" id="addr1" readonly="readonly">
					<input type="button" value="우편번호찾기" onclick="postSerch()">
				</td>
			</tr>
			<tr>
				<td>상세주소</td>
				<td>
					<input type="text" name="addr2" id="addr2">
				</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>
					<input type="text" name="email1" id="email1">@
					<input type="text" name="email2" id="email2">
				<select>
					<option value="naver.com">naver.com</option>
					<option value="google.com">google.com</option>
					<option value="daum.net">daum.net</option>
				</select>
				</td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td>
					<input type="text" name="phone" id="phone">
				</td>
			</tr>
			<tr>
				<td>취미</td>
				<td>
					<input type="checkbox" name="hobby" value="여행" id="hobby" >여행
					<input type="checkbox" name="hobby" value="쇼핑" id="hobby" >쇼핑
					<input type="checkbox" name="hobby" value="게임" id="hobby" >게임
					<input type="checkbox" name="hobby" value="기타" id="hobby" >기타
				</td>
				<%-- checkbox역시 radio처럼 같은 계열에선 name이 같아야한다. --%>
			</tr>
			<tr>
				<td>자기소개</td>
				<td>
					<textarea rows="10" cols="50" name="greeting" wrap="soft" id="greeting"></textarea>
					<%-- wrap="soft" 를 지정해 두면 가로 cols값이 꽉 찼을 때 자동으로 줄바꿈 --%>
				</td>
			</tr>
		</table>
		
		<div style="text-align:center;">
		<%-- body에 style을 주는 것을 inlineStyle 이라하고 위의 style보다 우선순위가 높다. --%>
			<input type="button" value="회원가입" onclick="checkValue()">
			<input type="reset" value="다시입력">
		</div>
	</form>
</body>
</html>