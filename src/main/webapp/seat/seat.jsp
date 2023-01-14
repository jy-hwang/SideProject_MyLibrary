<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model1.mylibrary.seat.UseSeatDetailDTO"%>
<%@page import="model1.mylibrary.seat.UseSeatDetailDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model1.mylibrary.seat.SeatDTO"%>
<%@page import="model1.mylibrary.seat.SeatDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../member/isStudent.jsp"%>
<%

SeatDAO seatDAO = new SeatDAO();
ArrayList<SeatDTO> seatList = seatDAO.selectListSeatDTO();

UseSeatDetailDAO usdDAO = new UseSeatDetailDAO();


String memberNo = session.getAttribute("userId").toString();



UseSeatDetailDTO usdDTO = usdDAO.selectUseSeat(memberNo);


seatDAO.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/seat.css" />


<script type="text/javascript" src="../resources/js/seat.js"></script>
</head>
<body>
	<%@ include file="../inc/header_inc.jsp"%>
	<%@ include file="../inc/header.jsp"%>

	
	<div class="container mt-3">
	<h3>3층열람실</h3>
	
		<table id="seatTable" class="table seat-table mt-3">
			<tr>
				<%
				int seatNo = 0 , seatCnt = 1;
				for (int i = 1 ; i < seatList.size()+10; i++) {
					SeatDTO dto = seatList.get(seatNo);
					if(i % 6 != 0 ){
						if( seatCnt % 3 != 0 ){
					%>
					<td id="<%=dto.getSeatId()%>" onclick=useSeat(this);
					<%= dto.getSeatStatus().equals("SE102") 
							? "style='background-color:lightgreen;pointer-events: none;'"
							: dto.getSeatStatus().equals("SE103")
								?"style='background-color:darkred;pointer-events: none;'"
								: "" %>
					>
					<%= seatNo + 1 %>번 좌석
					<br>
					<%=dto.getSeatStatusNM()%>
					</td>

					<%
						}else{
							%>
							
							<td class="border0"></td>
							<%
							seatCnt++;
							continue;
						}
					}else{
					%>
					</tr>
					<tr>
					
					<%
						seatCnt= 1;
						continue;
					}
					seatCnt++;
					seatNo++;	
				}
				%>
				
				
				
			</tr>
		</table>
		
		<form id="useDetailForm" style="display: none">
			<input type="text" name="seatId" value="<%= usdDTO.getSeatId() != null ? usdDTO.getSeatId() : "" %>" />
			<input type="text" name="memberNo" value="<%= usdDTO.getMemberNo() != null ? usdDTO.getMemberNo() : "" %>" />
			<input type="text" name="useEndSchedule" value="<%= usdDTO.getUseEndSchedule() != null ? usdDTO.getUseEndSchedule() : "" %>" />
			<input type="text" name="useStatus" value="<%= usdDTO.getUseStatus() != null ? usdDTO.getUseStatus() : "" %>" />
		</form>
		
		<form id="seatForm" action="useSeatProcess.jsp" method="post" style="display: none">
			<input type="text" name="seatId" />
			<input type="text" name="useStatus" value="SE102" />
		</form>
	</div>
</body>
</html>