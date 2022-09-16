function CheckAddProduct(){
	
	var productId = document.getElementById("productId");
	var name = document.getElementById("name");
	var unitPrice = document.getElementById("unitPrice");
	var unitsInStock = document.getElementById("unitsInStock");
	
	if(!check(/^P[0-9]{4,11}$/,
			  productId,
	          "[상품코드]\nP와 숫자를 조합하여 5-12자까지 입력하세요\n첫 글자는 반드시 P로 시작하세요")){
		return false;
	}
	
	if(name.value.length < 4 || name.value.length > 12){
		alert("[상품명]\n최소 4자에서 최대 12자까지 입력하세요!");
		name.select();
		name.focus();
		return false;
	}
	
	//isNaN? 숫자이면 false,숫자가 아니면 true 리턴
	if(unitPrice.value.length == 0 || isNaN(unitPrice.value)){
		alert("[가격]\n숫자만 입력하세요!");
		unitPrice.select();
		unitPrice.focus();
		return false;
	}
	
	if(unitPrice.value < 0){
		alert("[가격]\n음수는 입력할 수 없습니다!");
		unitPrice.select();
		unitPrice.focus();
		return false;
	}else if(!check(/^\d+(?:[.]?[\d]?[\d])?$/,unitPrice,"[가격]\n소숫점 둘째 자리까지만 입력하세요!")){
		return false;
	}
	
	
	if(isNaN(unitsInStock.value) ||
	   !unitsInStock.value){
		alert("[재고수]\n숫자만 입력하세요!");
		unitsInStock.select();
		unitsInStock.focus();
		return false;
	}
	
	//매개변수(정규표현식,변수,메시지)
	function check(regExp,e,msg){
		if(regExp.test(e.value)){
			return true;
		}
		
		alert(msg);
		e.select();
		e.focus();
		
		return false;
	}
	
	document.newProduct.submit();
}

function CheckAddMember(){
	
	var id = newMember.id.value;
	var name = newMember.name.value;
	var passwd1 = newMember.password.value;
	var passwd2 = newMember.password_confirm.value;
	var gender = newMember.gender.value;
	var birthday = newMember.birthday.value;
	var mail = newMember.mail.value;
	var phone = newMember.phone.value;
	var postCd = newMember.postCd.value;
	var address = newMember.address.value;
	var address2 = newMember.address2.value;
	
	if(!id){ 
	   alert("아이디를 입력하세요");
	   newMember.id.select();
	   newMember.id.focus();
	   return false;	 
	}
	
	if(!name){ 
	   alert("이름을 입력하세요");
	   newMember.name.select();
	   newMember.name.focus();
	   return false;	 
	}
	
	if(!passwd1){ 
	   alert("비밀번호를 입력하세요");
	   newMember.passwd1.select();
	   newMember.passwd1.focus();
	   return false;	 
	}
	
	if(!passwd2){ 
	   alert("비밀번호 확인을 입력하세요");
	   newMember.passwd1.select();
	   newMember.passwd1.focus();
	   return false;	 
	}
	
	if(passwd1 != passwd2){ 
	   alert("비밀번호가 틀립니다 확인하세요");
	   newMember.passwd1.select();
	   newMember.passwd1.focus();
	   return false;	 
	}
	
	if(!gender){ 
	   alert("성별을 입력하세요");
	   newMember.gender.select();
	   newMember.gender.focus();
	   return false;	 
	}
	
	
	if(!birthday){ 
	   alert("생일을 선택하세요");
	   newMember.birthday.select();
	   newMember.birthday.focus();
	   return false;	 
	}
	
	if(!phone){ 
	   alert("연락처를 입력 하세요");
	   newMember.phone.select();
	   newMember.phone.focus();
	   return false;	 
	}
	
	if(!postCd){ 
	   alert("우편번호를 선택 하세요");
	   newMember.postCd.select();
	   newMember.postCd.focus();
	   return false;	 
	}
	
	if(!address){ 
	   alert("우편번호를 선택 하세요");
	   newMember.address.select();
	   newMember.address.focus();
	   return false;	 
	}
	
	if(!address2){ 
	   alert("우편번호를 선택 하세요");
	   newMember.address2.select();
	   newMember.address2.focus();
	   return false;	 
	}
	
	
	document.newMember.submit();
		
}