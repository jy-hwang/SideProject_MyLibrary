<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.removeAttribute("UserId");
	session.removeAttribute("UserName");
	session.removeAttribute("UserType");
	session.invalidate();
	
	response.sendRedirect("../member/Login.jsp");

%>