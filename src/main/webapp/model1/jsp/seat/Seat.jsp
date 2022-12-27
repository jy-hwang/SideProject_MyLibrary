<%@page import="java.util.ArrayList"%>
<%@page import="model1.mylibrary.seat.SeatDTO"%>
<%@page import="model1.mylibrary.seat.SeatDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String seatStatus = "이용가능";
pageContext.setAttribute("seatStatus", seatStatus);

SeatDAO dao = new SeatDAO();
ArrayList<SeatDTO> seatList = dao.selectListSeatDTO();

dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.seat-table tr td {
	border: 1px solid black;
	width: 100px;
	height: 100px;
	text-align: center;
}

.seat-table tr td:hover:not(.border0) {
	background-color: gray;
}

.border0 {
	border: 0px !important;
}
</style>

<script>
function useSeat(elem){
	var seatId = elem.id.substring(elem.id.length-2,elem.id.length);
	
	var useSeat = confirm(seatId + "번 좌석을 이용하시겠습니까?");
	var seatForm = document.getElementById("seatForm");
	if(useSeat){
		seatForm.seatId.value = elem.id;
		seatForm.submit();
	}
	
}
function lpad(val, padLength, padString){
    while(val.length < padLength){
        val = padString + val;
    }
    return val;
}

</script>
</head>
<body>
	<%@ include file="../inc/Header_inc.jsp"%>
	<%@ include file="../inc/Header.jsp"%>

	<%--
	String[] strArr = new String[20];
	for (int i = 0; i < strArr.length; i++) {
		strArr[i] = Integer.toString(i + 1);
	}
	int trCnt = strArr.length / 4;
	--%>
	<div class="container mt-3">
	
<!-- 		<table>
			<tr>
				<td>반복1</td>
				<td>반복2</td>
				<td></td>
				<td>반복3</td>
				<td>반복4</td>
			</tr>
			<tr>
		</table> -->
	
		<table id="seatTable" class="table seat-table">
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
		<form id="seatForm" action="UseSeatProcess.jsp" method="post" style="display:none">
			<input type="text" name="seatId"/>
		</form>
	</div>
</body>
</html>