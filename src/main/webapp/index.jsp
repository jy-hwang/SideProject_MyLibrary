<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function chatWinOpen() {

	var chatId = document.getElementById("chatId");

	if (chatId.value == "") {
		alert("대화명을 입력 후 채팅창을 열어주세요");
		chatId.focus();
		return;
	}

	window.open("./webSocket/ChatWindow.jsp?chatId=" + chatId.value, "", "width = 480, height =600");
	chatId.value = "";

}
</script>
</head>
<body>
	<%@ include file="../inc/Header_inc.jsp"%>
	<div class="container">
		<h2>Hello 2nd Project - MyLibrary</h2>
		<div class="justify-content-center">
		<a  href="./book/BookList.jsp">
			<!-- <img alt="" src="./images/Main.jpg"> -->
			바로가기</a>
		</div>
		
		<div>
		<h4>
		웹소캣 채팅 - 대화명 적용해서 채팅창띄워주기
		</h4>
		대화명 : <input type="" id ="chatId"/>
		
		<button onclick="chatWinOpen();">채팅 참여하기</button>
		
		</div>
		
	</div>
	
	
</body>
</html>