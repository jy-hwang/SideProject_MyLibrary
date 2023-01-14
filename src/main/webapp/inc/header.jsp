<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../member/isLoggedIn.jsp"%>
<%
	
	String uNm = (String)session.getAttribute("userName");
	String uTp = (String)session.getAttribute("userType");
%>

<link rel="stylesheet" type="text/css" href="../resources/css/header.css" />

<div id="header">
	<ul class="header_ul_main">
	<%
	if(uTp.equalsIgnoreCase("stu")){
	%>
		<li><a href="#">학생정보</a>
			<ul class="ul_sub">
				<li><a href="../student/studentInfo.jsp">학생정보</a></li>
				<li><a href="../seat/seat.jsp">좌석선택</a></li>
				<li><a href="../seat/seatUseDetail.jsp">좌석이용내역</a></li>
			</ul></li>
		<%}else if(uTp.equalsIgnoreCase("stf")){ %>
		<li><a href="#">직원정보</a></li>
		<%}else if(uTp.equalsIgnoreCase("pub")){ %>
		<li><a href="#">개인정보</a></li>
		<%} %>
		<li><a href="#">도서</a>
			<ul class="ul_sub">
				<li><a href="../book/bookList.jsp">도서목록</a></li>
				<li><a href="../book/bookList.jsp?new=30">이달의새책</a></li>
				<li><a href="../book/borrowDetail.jsp">대여목록</a></li>
			</ul></li>
		<li><a href="#">알립니다</a>
			<ul class="ul_sub">
				<li><a href="../boardList.bo?boardId=10">공지사항</a></li>
				<li><a href="../board/list.do?boardId=20">FAQ</a></li>
				<li><a href="../board/list.do?boardId=30">QnA</a></li>
				<li><a href="../board/list.do?boardId=40">희망도서신청</a></li>
				<li><a href="../board/welcome.jsp">오시는길</a></li>
				<li><a href="../webSocket/chatMain.jsp">담소나누기</a></li>
			</ul></li>
	<%
	if(uTp.equalsIgnoreCase("stf")){
	%>
		<li><a href="#">관리</a>
			<ul class="ul_sub">
				<li><a href="../admin/cmmnList.jsp">공통코드관리</a></li>
			</ul></li>
			<%
	}
			%>
		<li><a href="../member/logout.jsp">로그아웃</a></li>
	</ul>
</div>
