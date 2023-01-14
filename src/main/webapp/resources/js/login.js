/**
 * 
 */

function formValidate() {
	var frm = document.loginForm;

	if ("" == frm.memberId.value) {
		alert("회원번호를 입력해주세요");
		frm.memberId.focus();
		return false;
	}

	if ("" == frm.memberPw.value) {
		alert("비밀번호를 확인해주세요");
		frm.loginPw.focus();
		return false;
	}

	frm.submit();

}

