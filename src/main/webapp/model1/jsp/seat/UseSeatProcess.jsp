<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../member/IsStudent.jsp"%>

<%
	String id = session.getAttribute("UserId").toString();
	String seatId = request.getParameter("seatId");
	
	System.out.println(id + seatId);

	
	

%>