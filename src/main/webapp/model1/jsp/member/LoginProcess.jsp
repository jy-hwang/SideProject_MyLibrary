<%@page import="model1.mylibrary.member.MemberDAO"%>
<%@page import="model1.mylibrary.member.MemberDTO"%>
<%@page import="utils.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberDAO dao = new MemberDAO();
	
	String mId = request.getParameter("memberId");
	String mPw = request.getParameter("memberPw");
	String mTp = request.getParameter("memberType");
	
	System.out.println("mId , mPw , mTp : "+ mId + " , " + mPw + " , " + mTp);
	
	MemberDTO dto = new MemberDTO();
	
	if(mTp.equalsIgnoreCase("stu")){
		dto = dao.getStuMemberDTO(mId, mPw);
	}else if(mTp.equalsIgnoreCase("stf")){
		dto = dao.getStfMemberDTO(mId, mPw);
	}else if(mTp.equalsIgnoreCase("pub")){
		dto = dao.getPubMemberDTO(mId, mPw);
	}
	
	System.out.println("dto : " + dto.getMemberNo() + dto.getMemberType() + dto.getMemberNm());
	
	
	
	dao.close();
	
	if(dto.getMemberNo() != null){
	
	    session.setAttribute("UserId", dto.getMemberNo());
	    session.setAttribute("UserName", dto.getMemberNm());
	    session.setAttribute("UserType", dto.getMemberType());
	    response.sendRedirect("../book/BookList.jsp");
	}else{
	    JSFunction.alertBack("로그인에 실패하였습니다.",out);
	  
	 }

%>