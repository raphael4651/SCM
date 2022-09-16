<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<!-- 부트스트랩 4.5 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
</head>
<body>
<%
	String id = "";

	if (session.getAttribute("sessionId") != null) {
		id = (String) session.getAttribute("sessionId");
	}
	
	String nick = "";
	
	//로그인 정보가 없으면 닉네임을 NULL로 지정
	if (session.getAttribute("sessionId") != null) {
		nick = (String) session.getAttribute("sessionId");
	} else {
		nick = "Guest";
	}
	
	//메시지 보낸 시간
	Date date = new Date();
    SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String strdate = simpleDate.format(date);

%>
<div id="messageWindow2"  style="background-image:url('${pageContext.request.contextPath}/resources/images/hpimage2.jpg');width:300px;height:539px;overflow: auto;"></div>
<br>
<div class="input-group mb-3">
	<input type="text" class="form-control col-sm-2 pt-3" 
		   onkeydown="if(event.keyCode==13){send();}" 
		   id="inputMessage"/>
		   
	<input type="submit" class="btn btn-primary" value="전송" onclick="send();" />
</div>

<script type="text/javascript">
	//WebSocket은 클라이언트(웹 브라우저)와 서버(웹 서버)가 양방향 통신
	var webSocket = new WebSocket('ws://localhost:8080/Chatting/broadcasting');
	var inputMessage = document.getElementById('inputMessage');
	var re_send = "";	//같은 이가 여러번 보낼때 이름 판별할 변수
	
	//웹 소켓이 에러가 났을 때 호출되는 이벤트
	webSocket.onerror = function(event) {
		onError(event)
	};
	
	//웹 소켓이 연결되었을 때 호출되는 이벤트
	webSocket.onopen = function(event) {
		onOpen(event)
	};
	
	//웹 소켓에서 메시시가 오면 호출되는 이벤트
	webSocket.onmessage = function(event) {
		onMessage(event)
	};
	
	//웹 소켓이 끊겼을 때 동작하는 함수.
	function onClose(event){
		var div=document.createElement('div');
		
		//접속했을 때 접속자들에게 알릴 내용.
		webSocket.send("<%=nick%> is disconnected\n");
	}
	//	OnMessage는 클라이언트에서 서버 측으로 메시지를 보내면 호출되는 함수.
	function onMessage(event) {
		//클라이언트에서 날아온 메시지를 |\| 단위로 분리한다
		var message = event.data.split("|\|");
			//금방 보낸 이를 re_send에 저장하고,금방 보낸 이가 다시 보낼경우 보낸이 출력 없도록 함.
			if(message[0] != re_send){
				//messageWindow2에 붙이기
				var who = document.createElement('div');
				who.style["padding"]="3px";
				who.style["margin-left"]="23px";
				who.style["font-size"]="15px"
				who.style['color'] ="white"
			    who.style["font-family"]="Noto Sans KR"
				who.innerHTML = message[0];
				document.getElementById('messageWindow2').appendChild(who);
				re_send = message[0];
			}
			//div는 받은 Message 출력할 공간.
			var div=document.createElement('div');
			div.style["width"]= "auto";
			div.style["word-wrap"] = "break-word";
			div.style["display"] = "inline-block";
			div.style["background-color"] = "#EAEAEA";
			div.style["border-radius"] = "10px";
			div.style["padding"] = "3px";
			div.style["margin-left"] = "23px";
			div.style["font-size"] = "15px"
		    div.style['color'] = "black"
			div.style["font-family"] = "Noto Sans KR"
			div.innerHTML =  message[1]+"<br>" +message[2];
			document.getElementById('messageWindow2').appendChild(div);
			//clear div 추가. 줄바꿈용.		
			var clear=document.createElement('div');
			clear.style["clear"]="both";
			document.getElementById('messageWindow2').appendChild(clear);
			//div 스크롤 아래로.
			messageWindow2.scrollTop = messageWindow2.scrollHeight;
     }
	//	OnOpen은 서버 측에서 클라이언트와 웹 소켓 연결이 되었을 때 호출되는 함수.
	function onOpen(event) { //접속했을 때, 내 영역에 보이는 글.
			var div=document.createElement('div');
			div.style["text-align"]="center";
			div.style["font-size"]="15px"
			div.style["font-family"]="Noto Sans KR"
			div.style['color'] ="blue"
			div.style["margin-top"]="63px";
			//div.innerHTML = "반갑습니다.";
			document.getElementById('messageWindow2').appendChild(div);
			var clear=document.createElement('div');
			clear.style["clear"]="both";
			document.getElementById('messageWindow2').appendChild(clear);
			//접속했을 때 접속자들에게 알릴 내용.
			<%-- webSocket.send("<%=nick%>|\|안녕하세요^^"); --%>
	}

	//	OnError는 웹 소켓이 에러가 나면 발생을 하는 함수.
	function onError(event) {
			alert("chat_server connecting error " + event.data);
	}
	// send 함수를 통해서 웹소켓으로 메시지를 보낸다.
	function send() {
		//inputMessage가 있을때만 전송가능
		if(inputMessage.value!=""){
			//	서버에 보낼때 날아가는 값.
			webSocket.send("<%=nick%>|\|" + "<%=strdate%>|\|"+ inputMessage.value);
			// 채팅화면 div에 붙일 내용
			var div=document.createElement('div');
			div.style["width"]="auto";
			div.style["word-wrap"]="break-word";
			div.style["float"]="right";
			div.style["display"]="inline-block";
			div.style["background-color"]="#FFE400";
			div.style["border-radius"]="2px";
			div.style['color'] ="black"
			div.style["padding"]="3px";
			div.style["border-radius"]="3px";
			div.style["margin-right"]="33px";
			div.style["font-size"]="15px"
			div.style["font-family"]="맑은 고딕"
			//div에 innerHTML로 문자 넣기
			div.innerHTML = inputMessage.value;
			document.getElementById('messageWindow2').appendChild(div);
			//clear div 추가
			var clear = document.createElement('div');
			clear.style["clear"] = "both";
			document.getElementById('messageWindow2').appendChild(clear);
			//inputMessage의 value값을 지운다.
			inputMessage.value = '';
			//textarea의 스크롤을 맨 밑으로 내린다.
			messageWindow2.scrollTop = messageWindow2.scrollHeight;
			//금방 보낸 사람을 임시 저장한다.
			re_send = "<%=nick%>";
		}
	}
</script>
</body>
</html>