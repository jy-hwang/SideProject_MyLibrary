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
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-12 mt-3 justify-content-center">
				<h3>로그인</h3>
				<fieldset>
					<form action="LoginProcess.jsp" method="POST">
						<div class="mb-3 row">
							<label for="loginId" class="col-sm-2 col-form-label">학번</label>
							<div class="col-sm-5">
								<input type="text" class="form-control" name="loginId"
									placeholder="아이디를입력하세요" />
							</div>
						</div>
						<div class="mb-3 row">
							<label for="inputPassword" class="col-sm-2 col-form-label">Password</label>
							<div class="col-sm-5">
								<input type="password" class="form-control" name="loginPw"
									placeholder="비밀번호를를입력하세요" />
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