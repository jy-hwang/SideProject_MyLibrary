<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../member/IsLoggedIn.jsp"%>
<%
	
	String uNm = (String)session.getAttribute("UserName");
	String uTp = (String)session.getAttribute("UserType");
%>

<link rel="stylesheet" type="text/css" href="../css/header.css" />

<div id="header">
	<ul class="header_ul_main">
	<%
	if(uTp.equalsIgnoreCase("stu")){
	%>
		<li><a href="#">학생정보</a>
			<ul class="ul_sub">
				<li><a href="../student/StudentInfo.jsp">학생정보</a></li>
				<li><a href="../seat/Seat.jsp">좌석선택</a></li>
				<li><a href="../seat/SeatUseDetail.jsp">좌석이용내역</a></li>
			</ul></li>
		<%}else if(uTp.equalsIgnoreCase("stf")){ %>
		<li><a href="#">직원정보</a></li>
		<%}else if(uTp.equalsIgnoreCase("pub")){ %>
		<li><a href="#">개인정보</a></li>
		<%} %>
		<li><a href="#">도서</a>
			<ul class="ul_sub">
				<li><a href="../book/BookList.jsp">도서목록</a></li>
				<li><a href="../book/BookList.jsp?new=30">이달의새책</a></li>
				<li><a href="../book/BorrowDetail.jsp">대여목록</a></li>
			</ul></li>
		<li><a href="#">알립니다</a>
			<ul class="ul_sub">
				<li><a href="../board/list.do?boardId=10">공지사항</a></li>
				<li><a href="../board/list.do?boardId=20">FAQ</a></li>
				<li><a href="../board/list.do?boardId=30">QnA</a></li>
				<li><a href="../board/list.do?boardId=40">희망도서신청</a></li>
				<li><a href="../board/Welcome.jsp">오시는길</a></li>
			</ul></li>
		<li><a href="../member/Logout.jsp">로그아웃</a></li>
	</ul>
</div>
