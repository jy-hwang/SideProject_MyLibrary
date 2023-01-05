<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../inc/Header_inc.jsp"%>
	<div class="container">
		<div class="justify-content-center">
			<a href="../book/BookList.jsp"> <img alt=""
				src="../resources/images/Error.jpg">
			</a>
		</div>
		<%
		out.print("오류가 발생했습니다.");
		out.print("최대한 빨리 수정하겠습니다.");
		%>

		<%
		int status = response.getStatus();

		if (status == 404) {

			out.print("404 에러가 발생했습니다.");
			out.print("<br> 파일 경로를  확인해주세요.");

		} else if (status == 405) {

			out.print("500 에러가 발생했습니다.");
			out.print("<br> 요청방식(method)을 확인해주세요.");

		} else if (status == 500) {

			out.print("500 에러가 발생했습니다.");
			out.print("<br> 소스 코드에 오류가 없는지 확인해주세요.");

		}
		%>
	</div>
</body>
</html>