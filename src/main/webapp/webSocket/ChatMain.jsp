<%@page import="utils.BoardPageBoot"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model1.mylibrary.book.BookDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model1.mylibrary.book.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../member/IsLoggedIn.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../resources/js/chatOpen.js"></script>
</head>
<body>

	<%@ include file="../inc/Header_inc.jsp"%>
	<%@ include file="../inc/Header.jsp"%>

	<div class="container">
		<h2>웹소캣 채팅</h2>
		<h4>대화명 적용해서 채팅창띄워주기</h4>

		<form class="row g-3">
			<div class="col-auto">
				<label for="chatNickname" class="visually-hidden">대화명</label> <input
					type="text" class="form-control" id="chatNickname"
					placeholder="대화명입력">
			</div>
			<div class="col-auto">
				<button type="button" class="btn btn-primary mb-3"
					onclick="chatWinOpen();">대화방 참여</button>
			</div>
		</form>
	</div>
</body>
</html>