<%@page import="java.util.List"%>
<%@page import="model1.mylibrary.book.BookDTO"%>
<%@page import="model1.mylibrary.book.BookDAO"%>
<%@page import="common.DBConnPool"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>커넥션 풀 테스트</h2>

<%

BookDAO dao = new BookDAO();
List<BookDTO> dto = dao.selectList();
for(BookDTO d : dto){
System.out.printf("%-20s\t %-10s\n",d.getTitle(), d.getAuthor());
}

dao.close();
%>
</body>
</html>