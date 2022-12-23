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
<script>

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



</script>


</head>

<body>
<%@ include file="../inc/Header_inc.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-12 mt-3 justify-content-center">
				<h3>로그인</h3>
				<fieldset>
					<form action="LoginProcess.jsp" method="POST" name="loginForm" onsubmit="return formValidate();">
						<div class="mb-3 row">
							<label for="loginId" class="col-sm-2 col-form-label">회원번호</label>
							<div class="col-sm-5">
								<input type="text" class="form-control" name="memberId"
									placeholder="회원번호를입력하세요" />
							</div>
						</div>
						<div class="mb-3 row">
							<label for="inputPassword" class="col-sm-2 col-form-label">비밀번호</label>
							<div class="col-sm-5">
								<input type="password" class="form-control" name="memberPw"
									placeholder="비밀번호를입력하세요" />
							</div>
						</div>
						<div class="justify-content-center">
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio"
									name="memberType" id="memberType1" value="pub" checked>
								<label class="form-check-label" for="inlineRadio1">일반</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio"
									name="memberType" id="memberType2" value="stu">
								<label class="form-check-label" for="inlineRadio2">학생</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio"
									name="memberType" id="memberType3" value="stf">
								<label class="form-check-label" for="inlineRadio3">직원</label>
							</div>
						</div>

						<div class="container my-3">
							<div class="col-md-12 text-center">
								<button class="btn btn-warning" type="submit">로그인</button>
							</div>
						</div>
					</form>
				</fieldset>
			</div>
		</div>

	</div>
</body>