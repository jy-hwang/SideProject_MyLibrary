<%@page import="utils.BoardPageBoot"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model1.mylibrary.book.BookDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model1.mylibrary.book.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/member/IsLoggedIn.jsp"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	
</script>
</head>
<body>

	<%@ include file="../inc/Header_inc.jsp"%>
	<%@ include file="../inc/Header.jsp"%>
	<div class="container">
		<h2>FAQ</h2>

		<form id="bookListForm" method="post" action="BorrowProcess.jsp">
			<table class="table table-striped" border="1" width="90%">
				<colgroup>
					<col width='5%'>
					<col width='40%'>
					<col width='10%'>
					<col width='15%'>
					<col width='10%'>
					<col width='10%'>
				</colgroup>
				<thead class="text-center">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
						<th>파일첨부</th>
					</tr>
				</thead>
				<tbody class="text-center">
					<c:choose>
						<c:when test="${empty boardLists }">
							<tr>
								<td colspan="7" align="center">등록된 게시물이 없습니다^^*</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${boardLists }" var="row" varStatus="loop">
								<tr align="center">
									<td>${map.totalCount - (((map.pageNum-1) * map.pageSize) + loop.index) }
									</td>
									<td align="left"><a
										href="../board/view.do?idx=${row.bbsIdx}&boardId=10">${row.title }</a></td>
									<td>${row.memberNo }</td>
									<td>${row.regiDate }</td>
									<td>${row.visitCount }</td>
									<td><c:if test="${not empty row.ofile }">
											<a
												href="../mvcboard/download.do?ofile=${row.ofile}&sfile=${row.sfile}&idx=${ row.idx }">[down]</a>
										</c:if></td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</form>
		<table class="table" width="90%">
			<tr>
				<td colspan='2'>${map.pagingImg }</td>
			</tr>
			<tr>
				<td align="center"><select name="searchField1">
						<option value="book_title">제목</option>
						<option value="book_author">저자</option>
						<option value="publisher">출판사</option>
				</select> <input type="text" name="searchWord1" /> <input type="submit"
					class="btn btn-warning" value="검색하기" /></td>
				<td>
					<button type="button" class="btn btn-info">희망도서신청</button>
					<button type="button" class="btn btn-danger">보류처리</button>
					<button type="button" class="btn btn-success">완료처리</button>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>