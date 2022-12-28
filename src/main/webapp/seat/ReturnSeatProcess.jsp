<%@page import="utils.JSFunction"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model1.mylibrary.seat.UseSeatDetailDAO"%>
<%@page import="model1.mylibrary.seat.SeatDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	
	String [] seatArr = request.getParameterValues("seatChk");
	String seatId ="";
	for(String s : seatArr){
		System.out.println("seat  : " + s);
		 seatId= s;
	} 

	SeatDAO seatDAO = new SeatDAO();
	UseSeatDetailDAO useSeatDetailDAO = new UseSeatDetailDAO();
	
	Map<String, Object> param = new HashMap<String,Object>();
	
	String memberNo = session.getAttribute("UserId").toString();
	
	String useStatus = "SE104";//이용완료 SE104
	String seatStatus ="SE101"; //이용가능 SE101
	
	//System.out.println(memberNo + seatId);
	
	param.put("memberNo",memberNo);
	param.put("seatId",seatId);
	param.put("seatStatus",seatStatus);

	int result1 = seatDAO.useReturnSeat(param);
	
	param.put("useStatus",useStatus);
	int result2 = useSeatDetailDAO.returnUseSeatDetail(param);
	
	seatDAO.close();
	useSeatDetailDAO.close();
	
	String msg = " 좌석의 이용종료처리가 완료되었습니다.";
	JSFunction.alertLocation(response, msg ,"./SeatUseDetail.jsp");
	
	
%>