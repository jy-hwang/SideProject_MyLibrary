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
	
	String idSave = request.getParameter("idSave");
	
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
	
	    session.setAttribute("userId", dto.getMemberNo());
	    session.setAttribute("userName", dto.getMemberNm());
	    session.setAttribute("userType", dto.getMemberType());
	    
	    if(idSave != null){
	    	System.out.println("===============cookie 만들기");
	    	System.out.println(idSave);
	    	Cookie cookieUserId = new Cookie("userId",dto.getMemberNo());
			Cookie cookieUserType = new Cookie("userType",dto.getMemberType());

			cookieUserId.setPath(request.getContextPath());
	    	cookieUserType.setPath(request.getContextPath());
	    	cookieUserId.setMaxAge(60 * 60);
	    	cookieUserType.setMaxAge(60 * 60);
	    	response.addCookie(cookieUserId);
	    	response.addCookie(cookieUserType);
	    		    	
	    }
	    
	    response.sendRedirect("../book/bookList.jsp");
	    
	}else{
	    JSFunction.alertBack("로그인에 실패하였습니다.",out);
	  
	 }

%>