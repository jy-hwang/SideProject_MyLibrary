<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<%@ include file="../inc/Header_inc.jsp"%>
<!-- <script src="../../js/member/SignUp.js"></script>-->
<script type="text/javascript">


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
	/*
	  if ("" == frm.email1.value) {
		alert("이메일을 확인해주세요");
		frm.email1.focus();
		return false;
	  }
	
	  if ("" == frm.email2.value) {
		alert("이메일 도메인을 선택해주세요");
		frm.email_domain.focus();
		return false;
	  }
	*/
	if (!confirm("입력하신 내용으로 가입하시겠습니까?")) {
		return false;
	}
	
	frm.submit();
}

</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<h3>회원가입</h3>
			<fieldset>
				<form action="SignUpProcess.jsp" name="signUpForm" method="POST" onsubmit="formValidate(this);">
					<div class="mb-3 row">
						<label for="loginId" class="col-sm-2 col-form-label">회원번호</label>
						<div class="col-sm">
							<div class="row">
								<div class="col-sm-4">
									<input type="text" class="form-control" name="userId"
										placeholder="회원번호을입력하세요" />
								</div>
								<div class="col-sm-4">
									<button type="button" class="btn btn-dark" name="dupIdChk"
										onclick="idCheck(this.form);">중복확인</button>
								</div>
								<div class="col-sm-4">
									<input type="checkbox" name="dupChkbox" style="display: none;">
								</div>
							</div>
							<span id="stuno"></span>
						</div>
					</div>
					<div class="mb-3 row">
						<label for="pass1" class="col-sm-2 col-form-label">비밀번호입력</label>
						<div class="col-sm-4">
							<input type="password" class="form-control" name="pass1"
								placeholder="비밀번호를입력하세요" /> <span id="pass1"></span>
						</div>
					</div>
					<div class="mb-3 row">
						<label for="pass2" class="col-sm-2 col-form-label">비밀번호확인</label>
						<div class="col-sm-4">
							<input type="password" class="form-control" name="pass2"
								placeholder="비밀번호를다시입력하세요" /> <span id="pass2"></span>
						</div>
					</div>
					<div class="mb-3 row">
						<label for="email" class="col-sm-2 col-form-label">이메일 </label>
						<div class="col-sm-4">
							<input type="email" class="form-control" name="email" id="email"
								placeholder="name@example.com">
						</div>
					</div>

					<div class="justify-content-center">
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio"
								name="inlineRadioOptions" id="inlineRadio1" value="pub">
							<label class="form-check-label" for="inlineRadio1">일반</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio"
								name="inlineRadioOptions" id="inlineRadio2" value="stu">
							<label class="form-check-label" for="inlineRadio2">학생</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio"
								name="inlineRadioOptions" id="inlineRadio3" value="stf">
							<label class="form-check-label" for="inlineRadio3">직원</label>
						</div>
					</div>
					<div class="container my-3">
						<div class="col-md-12 text-center">
							<button class="btn btn-warning" type="button"
								onclick="return formValidate();">회원가입</button>
						</div>
					</div>
				</form>
			</fieldset>
		</div>
	</div>
</body>