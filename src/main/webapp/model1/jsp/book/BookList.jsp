<%@page import="model1.mylibrary.book.BookDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model1.mylibrary.book.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    
    BookDAO dao = new BookDAO();
    ArrayList<BookDTO> bookList = dao.selectList(); 
    dao.close();
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
      
<%@ include file ="../inc/Header_inc.jsp" %>
<%@ include file ="../inc/Header.jsp" %>
    <h2>도서목록 </h2>
    <form method="get">  
    <table border="1" width="90%">
    <tr>
        <td align="center">
            <select name="searchField"> 
                <option value="title">제목</option> 
                <option value="content">내용</option>
            </select>
            <input type="text" name="searchWord" />
            <input type="submit" value="검색하기" />
        </td>
    </tr>   
    </table>
    </form>
    <table border="1" width="90%">
        <tr>
            <th width="10%">번호</th>
            <th width="15%">제목</th>
            <th width="15%">작가</th>
            <th width="10%">출판사</th>
            <th width="10%">발행일</th>
            <th width="15%">대여상태</th>
        </tr>
<%
if (bookList.isEmpty()) {
%>
        <tr>
            <td colspan="5" align="center">
                등록된 게시물이 없습니다^^*
            </td>
        </tr>
<%
}
else {
    int virtualNum = 0; 
    int countNum = 0;
    for (BookDTO dto : bookList)
    {
        //virtualNum = totalCount--;   
        //virtualNum = totalCount- (((pageNum -1) * pageSize ) + countNum++);
%>
        <tr align="center">
            <td><%= virtualNum %></td>  
            <td align="left"> 
                <%-- a href="View.jsp?num=<%= dto.getNum() %>"><%= dto.getTitle() %></a>  --%> 
            </td>
            <td align="center"><%= dto.getTitle() %></td>           
            <td align="center"><%= dto.getAuthor() %></td>   
            <td align="center"></td>
            <td align="center"></td>    
        </tr>
<%
    }
}
%>
    </table>
   
    <table border="1" width="90%">
        <tr align="center">
        <!-- 페이징 처리 -->
        <td>
        		<% System.out.println("현재경로 : " + request.getRequestURI());  %>
      <%--  <%= BoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum, request.getRequestURI()) %> --%>
        </td>
                <!-- 글쓰기 버튼 -->
            <td><button type="button" onclick="location.href='Write.jsp';">글쓰기
                </button></td>
        </tr>
    </table>

</body>
</html>