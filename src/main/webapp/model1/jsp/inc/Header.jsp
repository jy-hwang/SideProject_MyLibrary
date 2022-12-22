<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<style>
@import	url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');

* {
	margin: 0;
	padding: 0;
}

body {
	font-family: 17px 'Nanum Gothic', sans-serif;
}

a {
	text-decoration: none;
	color: #404040;
}

li {
	list-style: none;
}

#header {
	background: #b1daf4;
	height: 50px;
}

#header ul {
	width: 800px;
	margin: 0 auto;
	/*overflow: hidden;*/
}

#header .header_ul_main>li {
	float: left;
	width: 20%;
	line-height: 50px;
	text-align: center;
	background-color: #b1daf4;
	position: relative
}

#header .header_ul_main>li:hover .ul_sub {
	display: block;
}

#header .header_ul_main>li a {
	display: block;
}

#header .header_ul_main>li a:hover {
	background-color: #5a07f5;
	color: #fff;
}

#header .header_ul_main .ul_sub {
	position: absolute;
	top: 50px;
	left: 0;
	width: 100%;
	display: none;
}

#header .header_ul_main .ul_sub li {
	background-color: #e4d3e4;
}

</style>

<div id="header">
	<ul class="header_ul_main">
		<li><a href="#">학생정보</a>
			<ul class="ul_sub">
				<li><a href="../student/StudentInfo.jsp">학생정보</a></li>
				<li><a href="../seat/Seat.jsp">좌석선택</a></li>
			</ul></li>
		<li><a href="#">직원정보</a></li>
		<li><a href="#">도서</a>
			<ul class="ul_sub">
				<li><a href="../book/BookList.jsp">도서목록</a></li>
				<li><a href="../book/BookList.jsp?new=30">이달의새책</a></li>
				<li><a href="../book/BorrowDetail.jsp">대여목록</a></li>
			</ul></li>
		<li><a href="#">알립니다</a>
			<ul class="ul_sub">
				<li><a href="../board/BoardList.jsp?b_id=10">공지사항</a></li>
				<li><a href="../board/BoardList.jsp?b_id=20">FAQ</a></li>
				<li><a href="../board/BoardList.jsp?b_id=30">QnA</a></li>
				<li><a href="../board/BoardList.jsp?b_id=40">희망도서신청</a></li>
			</ul></li>
		<li><a href="../student/Logout.jsp">로그아웃</a></li>
	</ul>
</div>
