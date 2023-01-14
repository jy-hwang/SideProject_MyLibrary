<%@page import="utils.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
//세션 로그인 체크
if (session.getAttribute("userId") == null) {
	JSFunction.alertLocation("로그인 후 이용해주세요", "../member/login.jsp", out);
	return;
}
// userType 체크 : STF = 직원.
if ((session.getAttribute("userType") == null)
		|| !(session.getAttribute("userType").toString().equalsIgnoreCase("STF"))) {
	JSFunction.alertLocation("직원만 이용가능합니다", "../book/bookList.jsp", out);
	return;
}
%>