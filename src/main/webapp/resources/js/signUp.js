/**
 * 
 */
 
 
function formValidate() {
	//form 에서 this 를 통해 전달한 DOM 과 동일하다.
	var frm = document.signUpForm;
	//var frm = document.forms[0];

	//아이디 입력 값이 있는 지 검증
	if ("" == frm.userId.value) {
		alert("아이디를 입력해주세요");
		frm.userId.focus();
		return false;
	}
	if (frm.dupChkbox.checked == false) {
		alert("중복확인을 해주세요");
		frm.userId.focus();
		return false;
	}
	
	if ("" == frm.pass2.value) {
		alert("비밀번호를 확인해주세요");
		frm.pass2.focus();
		return false;
	}

	if (frm.pass1.value != frm.pass2.value) {
		alert("비밀번호가 일치하지 않습니다.");
		frm.pass1.value = "";
		frm.pass2.value = "";
		return false;
	}
	if (!confirm("입력하신 내용으로 가입하시겠습니까?")) {
		return false;
	}
	
	frm.submit();
}