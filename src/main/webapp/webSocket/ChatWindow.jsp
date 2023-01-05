<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
var webSocket = new WebSocket("<%= application.getInitParameter("CHAT_ADDR")%>/ChatingServer");

var chatWindow, chatMessage, chatId;

//채팅창이 열리면 DOM 객체 저장
window.onload = function() {
	chatWindow = document.getElementById("chatWindow");		//대화창
	chatMessage = document.getElementById("chatMessage");	//메시지 입력창
	chatId = document.getElementById("chatId").value;		//대화명표시란
}


//메시지전송
function sendMessage() {
	chatWindow.innerHTML += "<div class='myMsg'>" + chatMessage.value + "</div>"
	webSocket.send(chatId + '|' + chatMessage.value)
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
	//alert();
	chatWindow = document.getElementById("chatWindow");		//대화창
	chatWindow.innerHTML += "웹 소켓 서버에 연결되었습니다. <br/>";
	
	chatWindow.innerHTML += "${param.chatId} 님이 입장했습니다.<br/>"
	memberWindow = document.getElementById("memberWindow");
	memberWindow.innerHTML += "${param.chatId} <br/>"
};
//웹 소켓이 닫혔을 때(서버와의 연결이 끊겼을 때) 실행
webSocket.onclose = function(event) {
	
	chatWindow.innerHTML += "${param.chatId}님이 종료했습니다."
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

			if (content.match("/" + chatId)) {
				var temp = content.replace(("/" + chatId), "[귓속말] : ");
				chatWindow.innerHTML += "<div class='whisper'>" + sender + " " + temp + "</div>";
			}

		} else {
			chatWindow.innerHTML += "<div class='public'>" + sender + " : " + content + "</div>";

		}

	}
	chatWindow.scrollTop = chatWindow.scrollHeight;

};

</script>
<link rel="stylesheet" type="text/css" href="../css/subChat.css" />
<title>웹 소켓 채팅</title>
</head>
<body>
	대화명 :
	<input type="text" id="chatId" value="${param.chatId} " readonly>
	<button id="closeBtn" onclick="disConnect();">채팅종료</button>
	 <div id="chatMember">
            <div id="chatWindow"></div>
            <div id="memberWindow"></div>
        </div>
	<div>
		<input type="text" id="chatMessage" onkeyup="enterKey()">
		<button id="sendBtn" onclick="sendMessage();">전송</button>

	</div>


</body>
</html>