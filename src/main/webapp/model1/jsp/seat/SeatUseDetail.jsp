<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model1.mylibrary.seat.UseSeatDetailDTO"%>
<%@page import="model1.mylibrary.seat.UseSeatDetailDAO"%>
<%@page import="utils.BoardPageBoot"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../member/IsLoggedIn.jsp"%>
<%
UseSeatDetailDAO dao = new UseSeatDetailDAO();

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
param.put("memberNo", session.getAttribute("UserId").toString());

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

ArrayList<UseSeatDetailDTO> useSeatList = dao.selectListUseSeatDTO(param);

//

 





dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function returnSeat() {
		var seats = [];
		var count = 0;
		$("input[type='checkbox']:checked").each(function(idx) {
			seats.push(this.value);
			count++;
		});
		console.log("seats  : ", seats);
		if (count == 0) {
			alert('이용종료할 좌석을 선택하세요');
			return;
		}

		var form = document.getElementById("seatUseListForm");

		form.submit();

	}
</script>
</head>
<body>

	<%@ include file="../inc/Header_inc.jsp"%>
	<%@ include file="../inc/Header.jsp"%>
	<h2>좌석이용목록</h2>
	<form method="get">
		<table class="table" border="1" width="90%">
			<tr>
				<td align="center"><select name="searchField1">
						<option value="book_title"
							<%=searchField1 != null && searchField1.equals("book_title") ? "selected" : ""%>>제목</option>
						<option value="book_author"
							<%=searchField1 != null && searchField1.equals("book_author") ? "selected" : ""%>>저자</option>
						<option value="publisher"
							<%=searchField1 != null && searchField1.equals("publisher") ? "selected" : ""%>>출판사</option>
				</select> <input type="text" name="searchWord1"
					value=<%=searchWord1 != null && searchWord1 != "" ? searchWord1 : ""%>>
					<input type="submit" class="btn btn-warning" value="검색하기" /></td>
			</tr>
			<tr>
				<td align="center"><select name="searchField2">
						<option value="publish_date">발행일</option>
				</select> <input type="date" name="searchWord2"
					value=<%=searchWord2 != null && searchWord2.equals("") ? "" : searchWord2%> />
					<input type="submit" class="btn btn-danger" value="검색하기" /></td>
			</tr>
		</table>
	</form>
	<form id="seatUseListForm" action="ReturnSeatProcess.jsp" method="post">
		<table class="table table-striped" border="1" width="90%">
			<thead class="text-center">
				<tr>
					<th>선택</th>
					<th>번호</th>
					<th>좌석이름</th>
					<th>좌석위치</th>
					<th>이용시작시간</th>
					<th>반납예정시간</th>
					<th>이용종료시간</th>
					<th>이용상태</th>
				</tr>
			</thead>
			<tbody class="text-center">
				<%
				if (useSeatList.isEmpty()) {
				%>
				<tr>
					<td colspan="8" align="center">이용한 좌석이 없습니다^^*</td>
				</tr>
				<%
				} else {
				int virtualNum = 0;
				int countNum = 0;
				for (UseSeatDetailDTO dto : useSeatList) {
					//virtualNum = totalCount--;   
					virtualNum = totalCount - (((pageNum - 1) * pageSize) + countNum++);
				%>
				<tr>
					<td>
						<%
						//System.out.println(dto.getBookStatus());
						if (dto.getUseStatus().equalsIgnoreCase("SE102")) {
						%> <input type="checkbox" name="bookChk"
						value="<%=dto.getSeatId()%>" /> <%
 }
 %>
					</td>
					<td><%=virtualNum%></td>
					<%--  
            <td align="left"> 
                 a href="View.jsp?num=<%= dto.getNum() %>"><%= dto.getTitle() %></a>   
            </td>
            --%>
					<td style="display: none;"><%=dto.getSeatId()%></td>
					<td><%=dto.getSeatNm()%></td>
					<td><%=dto.getSeatLocation()%></td>
					<%
					String startTime =new SimpleDateFormat("yyyyMMdd_HmsS").format( dto.getUseStartTime() );
					%>
					<td>가나다
							<%= startTime %>
					</td>
					<td>
						<c:set var="startTime" value="<%= dto.getUseStartTime() %>" />
						<fmt:formatDate value="${startTime}" type="time" dateStyle="short" />
					</td>
					<td>
						<c:set var="endSchedule" value="<%= dto.getUseEndSchedule() %>" />
						<fmt:formatDate value="${endSchedule}" type="time" dateStyle="short" />
					</td>
					<td>
						<c:set var="endTime" value="<%= dto.getUseEndTime() %>" />
						<fmt:formatDate value="${endTime}" type="time" dateStyle="short" />
					</td>
					<td style="display: none;"><%=dto.getUseStatus()%></td>
					<td><%=dto.getUseStatusNm()%></td>
				</tr>
				<%
				}
				}
				%>
			</tbody>
		</table>
	</form>
	<table class="table" width="90%">
		<tr align="right">
			<!-- 반납 버튼-->
			<td><button type="button" class="btn btn-info"
					onclick="returnSeat();">이용종료하기</button></td>
		</tr>
		<tr align="center">
			<!-- 페이징 처리 -->
			<td>
				<%
				System.out.println("현재경로 : " + request.getRequestURI());
				%> <%=BoardPageBoot.pagingStr(mapPaging)%>
			</td>
		</tr>
	</table>

</body>
</html>