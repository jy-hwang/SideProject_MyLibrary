<%@page import="model1.mylibrary.seat.SeatDAO"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="model1.mylibrary.seat.UseSeatDetailDAO"%>
<%@page import="utils.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../member/IsStudent.jsp"%>

<%
SeatDAO seatDAO = new SeatDAO();
UseSeatDetailDAO useSeatDetailDAO = new UseSeatDetailDAO();

Map<String, Object> param = new HashMap<String, Object>();

String memberNo = session.getAttribute("UserId").toString();
String seatId = request.getParameter("seatId");
String useStatus = request.getParameter("useStatus");//대여중 SE102

param.put("memberNo", memberNo);
param.put("seatId", seatId);
param.put("seatStatus", useStatus);

int result1 = seatDAO.useReturnSeat(param);
param.put("useStatus", useStatus);
int result2 = useSeatDetailDAO.useSeatDetail(param);

seatDAO.close();
useSeatDetailDAO.close();

String msg = " 좌석의 이용처리가 시작되었습니다.";
JSFunction.alertLocation(response, msg, "./SeatUseDetail.jsp");
%>