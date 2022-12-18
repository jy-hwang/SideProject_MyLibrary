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
<script src="../../js/student/SignUp.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<h3>회원가입</h3>
			<fieldset>
				<form action="SignUpProcess.jsp" name="signUpFrm" method="POST">
					<div class="mb-3 row">
						<label for="loginId" class="col-sm-2 col-form-label">학번</label>
						<div class="col-sm">
							<div class="row">
								<div class="col-sm-4">
									<input type="text" class="form-control" name="userId"
										placeholder="학번을입력하세요" />
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
								placeholder="비밀번호를입력하세요" />
								<span id="pass1"></span>
						</div>
					</div>
					<div class="mb-3 row">
						<label for="pass2" class="col-sm-2 col-form-label">비밀번호확인</label>
						<div class="col-sm-4">
							<input type="password" class="form-control" name="pass2"
								placeholder="비밀번호를다시입력하세요" />
						<span id="pass2"></span>
						</div>
					</div>
					<div class="mb-3 row">
						<label for="email" class="col-sm-2 col-form-label">이메일
							</label>
							<div class="col-sm-4"> <input type="email" class="form-control" name="email"
							id="email" placeholder="name@example.com">
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