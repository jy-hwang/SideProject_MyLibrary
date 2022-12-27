<%@page import="utils.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
//세션 로그인 체크
if (session.getAttribute("UserId") == null) {
	JSFunction.alertLocation("로그인 후 이용해주세요", "../member/Login.jsp", out);
	return;
}
// userType 체크 : STF = 직원.
if ((session.getAttribute("UserType") == null)
		|| (session.getAttribute("UserType").toString().equalsIgnoreCase("STF"))) {
	JSFunction.alertLocation("직원만 이용가능합니다", "../book/BookList.jsp", out);
	return;
}
%>