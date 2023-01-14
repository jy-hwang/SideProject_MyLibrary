<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">

var chatWindow, chatMessage, chatNickname;

//채팅창이 열리면 DOM 객체 저장
window.onload = function() {
	//alert("창이열리면");
	chatMessage = document.getElementById("chatMessage");	//메시지 입력창
	chatNickname = document.getElementById("chatNickname").value;		//대화명표시란

	chatWindow = document.getElementById("chatWindow");		//대화창
	chatWindow.innerHTML += "웹 소켓 서버에 연결되었습니다. <br/>";

	chatWindow.innerHTML += "${param.chatNickname} 님이 입장했습니다.<br/>"
	memberWindow = document.getElementById("memberWindow");
	memberWindow.innerHTML += "${param.chatNickname} <br/>"
}

var webSocket = new WebSocket("<%= application.getInitParameter("CHAT_ADDR")%>/ChatingServer");

//메시지전송
function sendMessage() {
	chatWindow.innerHTML += "<div class='myMsg'>" + chatMessage.value + "</div>"
	webSocket.send(chatNickname + '|' + chatMessage.value)
	chatMessage.value = "";
	chatWindow.scrollTop = chatWindow.scrollHeight;
}

function disConnect() {
	webSocket.close();
	alert("채팅을 종료합니다");
	self.close();
}

function enterKey() {
	if (window.event.keyCode == 13) {
		sendMessage();
	}
}


//웹 소켓 서버에 연결됐을 때 실행
webSocket.onopen = function(event) {
	//alert("웹소켓연결");
	
};
//웹 소켓이 닫혔을 때(서버와의 연결이 끊겼을 때) 실행
webSocket.onclose = function(event) {

	chatWindow.innerHTML += "${param.chatNickname}님이 종료했습니다."
	chatWindow.innerHTML += "웹 소켓 서버가 종료되었습니다. <br/>";
};

//에러 발생 시 실행
webSocket.onerror = function(event) {
	alert(event.data);
	chatWindow.innerHTML += "채팅 중 에러가 발생하셨습니다. <br/>";
};

//메시지를 받았을 때 실행
webSocket.onmessage = function(event) {
	var message = event.data.split("|");
	var sender = message[0];
	var content = message[1];

	if (content != "") {

		if (content.match("/")) {

			if (content.match("/" + chatNickname)) {
				var temp = content.replace(("/" + chatNickname), "[귓속말] : ");
				chatWindow.innerHTML += "<div class='whisper'>" + sender + " " + temp + "</div>";
			}

		} else {
			chatWindow.innerHTML += "<div class='public'>" + sender + " : " + content + "</div>";

		}

	}
	chatWindow.scrollTop = chatWindow.scrollHeight;

};
</script>
<link rel="stylesheet" type="text/css" href="../resources/css/subChat.css" />
<title>웹 소켓 채팅</title>
</head>
<body>
	<%@ include file="../inc/header_inc.jsp"%>
	<div class="container">
	대화명 :
	<input type="text" id="chatNickname" value="${param.chatNickname} " readonly>
	<button id="closeBtn" class="btn btn-danger"onclick="disConnect();">채팅종료</button>
	<div id="chatMember">
		<div id="chatWindow"></div>
		<div id="memberWindow"></div>
	</div>
	
	<form class="row g-3 mt-3">
		<div class="col-auto">
			<label for="chatMessage" class="visually-hidden">대화내용</label> <input
				type="text" class="form-control" id="chatMessage"
				onkeyup="enterKey();" placeholder="대화내용입력">
		</div>
		<div class="col-auto">
			<button type="button" class="btn btn-info mb-3"
				onclick="sendMessage();">전송</button>
		</div>
	</form>
</div>
</body>
</html>