<%@page import="utils.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

if(session.getAttribute("UserId") == null){
	JSFunction.alertLocation("로그인 후 이용해주세요","../member/Login.jsp",out);
	return;
}

//userType 체크 : STU = 학생, 학생이아니면 접근 안되도록.
if ((session.getAttribute("UserType") == null)
		|| !(session.getAttribute("UserType").toString().equalsIgnoreCase("STU"))) {
	JSFunction.alertLocation("학생만 이용가능합니다", "../book/BookList.jsp", out);
	return;
}

%>