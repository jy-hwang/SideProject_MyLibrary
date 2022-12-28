<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="model1.mylibrary.book.BorrowDetailDTO"%>
<%@page import="model1.mylibrary.book.BorrowDetailDAO"%>
<%@page import="model1.mylibrary.book.BookDTO"%>
<%@page import="model1.mylibrary.book.BookDAO"%>
<%@page import="utils.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	BookDAO bookDao = new BookDAO();
	BookDTO bookDto = new BookDTO();
	BorrowDetailDAO borrowDao = new BorrowDetailDAO();
	
	BorrowDetailDTO borrowDto = new BorrowDetailDTO();
	
	String mId = session.getAttribute("UserId").toString();

	String [] borrowList = request.getParameterValues("bookChk");
	
	Map<String, Object> param = new HashMap<String, Object>();
	/* System.out.println("mId : " +mId);*/
	param.put("memberNo",session.getAttribute("UserId").toString());
	int result1 = 0, result2 = 0 ; 
	for(String s : borrowList){
		System.out.println("books.book_code  : " + s);
		param.put("bookCode",s);
		param.put("borrowStatus","BK102");
	
		result1 += borrowDao.borrowBookDetail(param);
		param.put("bookStatus","BK102");
		result2 += bookDao.borrowReturnBook(param);
	} 

	bookDao.close();
	borrowDao.close();
	String msg = result1 + " 권의 대여처리가 완료되었습니다.";
	JSFunction.alertLocation(response, msg ,"../book/BorrowDetail.jsp");
	
%>