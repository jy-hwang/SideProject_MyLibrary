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
<%
BookDAO dao = new BookDAO();

Map<String, Object> param = new HashMap<String, Object>();

String searchField1 = request.getParameter("searchField1");
String searchWord1 = request.getParameter("searchWord1");
String searchField2 = request.getParameter("searchField2");
String searchWord2 = request.getParameter("searchWord2");

if (searchWord1 != null) {
	param.put("searchField1", searchField1);
	param.put("searchWord1", searchWord1);
}
if (searchWord2 != null) {
	param.put("searchField2", searchField2);
	param.put("searchWord2", searchWord2);
}
int totalCount = dao.selectCount(param);

/**페이징 코드 추가부분 s *******************************/
//POSTS_PER_PAGE
int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));
int totalPage = (int) Math.ceil((double) totalCount / pageSize);

int pageNum = 1;
String pageTemp = request.getParameter("pageNum");

if (pageTemp != null && !pageTemp.equals("")) {
	pageNum = Integer.parseInt(pageTemp);
}

int start = (pageNum - 1) * pageSize;
int end = pageSize;
System.out.println("페이징 관련 변수 : " + " " + pageSize + " " + blockPage + " " + totalPage + " " + start + " " + end);
param.put("start", start);
param.put("end", end);

Map<String, Object> mapPaging = new HashMap<String, Object>();
mapPaging.put("totalCount", totalCount);
mapPaging.put("pageSize", pageSize);
mapPaging.put("blockPage", blockPage);
mapPaging.put("pageNum", pageNum);
mapPaging.put("reqUrl", request.getRequestURI());

/**페이징 코드 추가부분 e *******************************/

ArrayList<BookDTO> bookList = dao.selectListPage(param);

dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/bookBorrowReturn.js"></script>
</head>
<body>

	<%@ include file="../inc/Header_inc.jsp"%>
	<%@ include file="../inc/Header.jsp"%>
	<div class="container">
	<h2>도서추가</h2>
	<form id="bookAddForm" method="post" action="BookAddProcess.jsp">
		<table class="table table-striped" border="1" width="90%">
			<thead class="text-center">

			</thead>

			<tbody>
			<tr style="display:'hidden'">
			<td>
			</tr>
				<tr>
					<td>책 장르</td>
					<td><select>
					<option></option>
					
					</select></td>
				</tr>
				<tr>
					<td>책 제목</td>
					<td><input type="text" name="title" style="width: 90%;" /></td>
				</tr>

				<tr>
					<td>책 저자</td>
					<td><input type="text" name="title" style="width: 90%;" /></td>
				</tr>
				<tr>
					<td>출판사</td>
					<td><input type="text" name="title" style="width: 90%;" /></td>
				</tr>
				<tr>
					<td>발행일</td>
					<td><input type="text" name="title" style="width: 90%;" /></td>
				</tr>

				<tr>
					<td>내용</td>
					<td><textarea name="content"
							style="width: 90%; height: 100px;"></textarea></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button class="btn btn-info" type="submit">작성 완료</button>
						<button class="btn btn-danger" type="reset">다시 입력</button>
						<button class="btn btn-success" type="button" onclick="location.href='List.jsp';">
							목록 보기</button>
					</td>
				</tr>

			</tbody>
		</table>
	</form>
</div>
</body>
</html>