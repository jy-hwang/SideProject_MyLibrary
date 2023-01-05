/**
 * 
 */

function chatWinOpen() {

	var chatNickname = document.getElementById("chatNickname");

	if (chatNickname.value == "") {
		alert("대화명을 입력 후 채팅창을 열어주세요");
		chatNickname.focus();
		return;
	}

	window.open("./ChatWindow.jsp?chatNickname="+chatNickname.value, "", "width = 480, height =600");
	chatNickname.value = "";

}