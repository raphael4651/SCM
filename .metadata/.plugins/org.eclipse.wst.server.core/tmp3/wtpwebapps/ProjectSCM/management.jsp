<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="menu.jsp" %>

<html>
<head>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

<!-- 유효성 검사를 하기위해 자바스크립트 호출 -->
<script src="./resources/js/validation.js"></script>

<script>
	$(document).ready(function () {
	   $(function () {
	            $('.phone').keydown(function (event) {
	             var key = event.charCode || event.keyCode || 0;
	             $text = $(this); 
	             if (key !== 8 && key !== 9) {
	                 if ($text.val().length === 3) {
	                     $text.val($text.val() + '-');
	                 }
	                 if ($text.val().length === 8) {
	                     $text.val($text.val() + '-');
	                 }
	             }
	
	             return (key == 8 || key == 9 || key == 46 || (key >= 48 && key <= 57) || (key >= 96 && key <= 105));
				 // Key 8번 백스페이스, Key 9번 탭, Key 46번 Delete 부터 0 ~ 9까지, Key 96 ~ 105까지 넘버패트
				 // 한마디로 JQuery 0 ~~~ 9 숫자 백스페이스, 탭, Delete 키 넘버패드외에는 입력못함
	         })
	   });
	});
</script>

<!-- 생일을 달력을 통해 입력 datepicker 선언 -->
<script>
	$(function(){
		$("#birthday").datepicker({
			changeMonth:true,
			changeYear:true,
			dateFormat:"yy-mm-dd",
			prevText:"이전 달",
			nextText:"다음 달",
			monthNames:['1월','2월','3월','4월',
						'5월','6월','7월','8월',
						'9월','10월','11월','12월'
				       ],
			monthNamesShort:['1월','2월','3월','4월',
							'5월','6월','7월','8월',
							'9월','10월','11월','12월'
					       ],
			dayNames:['일','월','화','수','목','금','토'],
			dayNamesShort:['일','월','화','수','목','금','토'],
			dayNamesMin:['일','월','화','수','목','금','토'],
			showMonthAfterYear:true,
			yearSuffix:'년'
		});
	});
</script>

<!-- 다음 우편번호 API 선언 -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function Postcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("addressName2").value = extraAddr;
                
                } else {
                    document.getElementById("addressName2").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postCd').value = data.zonecode;
                document.getElementById("addressName").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("postCd").focus();
            }
        }).open();
    }
</script>

<title>회원 수정</title>
</head>
<body>
	
	<%-- jstl로 데이터베이스 연결 --%>
	<%@ include file="dbconn2.jsp" %>
	
	<%--
	     로그인한 사용자 정보를 가져온다.
	 --%>
	<sql:query var="resultSet"
	           dataSource="${dataSource}">
		select * from member where id = ?
		<sql:param value="${sessionId}"/>
	</sql:query>
	 
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">회원 수정</h1>
		</div>
	</div>

	<c:forEach var="row"
			   items="${resultSet.rows}">

	<div class="container">
		<form name="newMember" 
		      class="form-horizontal"  
		      action="managementUpdate.jsp" 
		      method="post">
			<div class="form-group  row">
				<label class="col-sm-2">아이디</label>
				<div class="col-sm-3">
					<input  name="id" type="text" 
					        class="form-control"
					        value="<c:out value='${row.id}'/>" 
					        placeholder="아이디입력" >
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">비밀번호</label>
				<div class="col-sm-3">
					<input  name="password" type="password" class="form-control" placeholder="비밀번호 입력" >
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">비밀번호확인</label>
				<div class="col-sm-3">
					<input   name="password_confirm" type="password" class="form-control" placeholder="비밀번호 확인 입력" >
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">이름</label>
				<div class="col-sm-3">
					<input  name="name" type="text" 
					        class="form-control"
					        value="<c:out value='${row.name}'/>" 
					        placeholder="이름 입력" >
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">성별</label>
				<div class="col-sm-10">
					
					<c:set var="gender"
					       value="${row.gender}"/>
					<input name="gender" type="radio" value="남" <c:if test="${gender.equals('남')}"><c:out value="checked"/></c:if>/>남 
					<input name="gender" type="radio" value="여" <c:if test="${gender.equals('여')}"><c:out value="checked"/></c:if>/>여
				</div>
			</div>

			<div class="form-group  row">
				<label class="col-sm-2">생일</label>
				<div class="col-sm-3">
					<input id="birthday" 
					       name="birthday" type="text" 
					       class="form-control"
					       value="<c:out value='${row.birthday}'/>" 
					       placeholder="생일 입력" >
				</div>
			</div>


			<div class="form-group row">
				<label class="col-sm-2">이메일</label>
				<div class="col-sm-3">
					<input type="text" name="email" 
					       class="form-control"
					       value="<c:out value='${row.email}'/>"> 
				</div>				
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">전화번호</label>
				<div class="col-sm-3">
					<input class="phone" 
					       name="phone" 
					       type="text" 
					       class="form-control"
					       maxlength="13" 
					       size="13" 
					       value="<c:out value='${row.phone}'/>"
					       placeholder="000-0000-0000" >

				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">우편번호</label>					
				<div class="col-sm-6"> 
					<input class="col-sm-2" 
					       id="postCd" 
					       name="postCd" 
					       type="text"
					       readonly 
					       value="<c:out value='${row.postCd}'/>"
					       class="form-control" />
					<input class="col-sm-4" 
					       type="button" 
					       value="우편번호 찾기" 
					       onclick="Postcode()"/>       
				</div>	
			</div>
			<div class="form-group row">
				<label class="col-sm-2">주소</label>					
				<div class="col-sm-7">
					<input id="addressName" name="address" 
					       type="text" readonly="readonly"
					       value="<c:out value='${row.address}'/>"
					       class="form-control" />
				</div>				
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">상세주소</label>					
				<div class="col-sm-7">
					<input id="addressName2" name="address2"  
					       type="text"
					       value="<c:out value='${row.address2}'/>"  
					       class="form-control" />
				</div>				
			</div>
			<div class="form-group  row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="button" class="btn btn-primary" value="수정" onclick="CheckAddMember()"> 
					<input type="reset" class="btn btn-success" value="취소" onclick="reset()">
					<input type="button" class="btn btn-danger" value="회원탈퇴" 
					       onclick="location.href='delete.jsp'">
				</div>
			</div>
		</form>
	</div>
	</c:forEach>
	<jsp:include page="footer.jsp"/>
</body>
</html>






