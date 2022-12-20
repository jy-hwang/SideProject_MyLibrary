<%@page import="utils.BoardPageBoot"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model1.mylibrary.book.BookDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model1.mylibrary.book.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    <%
    
    BookDAO dao = new BookDAO();
    
    Map<String, Object> param = new HashMap<String,Object>();
    
    String searchField = request.getParameter("searchField2");
    String searchWord = request.getParameter("searchWord");
    
    if(searchWord != null){
    	param.put("searchField2", searchField);
    	param.put("searchWord", searchWord);
    }

    
    
  int totalCount = dao.selectCount(param);
    
    /**페이징 코드 추가부분 s *******************************/
    
    int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
    int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));
    int totalPage = (int)Math.ceil((double)totalCount / pageSize);
    
    int pageNum = 1;
    String pageTemp = request.getParameter("pageNum");
    
    if(pageTemp != null && !pageTemp.equals("")){
    	pageNum = Integer.parseInt(pageTemp);
    }
    
    int start = (pageNum -1 ) * pageSize + 1;
    int end = pageNum * pageSize;
    System.out.println("페이징 관련 변수 : " + " " + pageSize + " "+blockPage + " "+ totalPage + " " +start +" " + end);
    param.put("start",start);
    param.put("end",end);
    
    Map<String, Object> mapPaging = new HashMap<String,Object>();
    mapPaging.put("totalCount",totalCount);
    mapPaging.put("pageSize",pageSize);
    mapPaging.put("blockPage",blockPage);
    mapPaging.put("pageNum",pageNum);
    mapPaging.put("reqUrl",request.getRequestURI());
    
    
    /**페이징 코드 추가부분 e *******************************/
    
    
    ArrayList<BookDTO> bookList = dao.selectListPage(param); 
    
    
    
    
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
            <select name="searchField2"> 
                <option value="book_title">제목</option> 
                <option value="book_author">저자</option>
                <option value="publisher">출판사</option>
            </select>
            <input type="text" name="searchWord" />
            <input type="submit" value="검색하기" />
        </td>
    </tr>   
    </table>
    </form>
    <table border="1" width="90%">
        <tr>
        	<th>선택</th>
            <th>번호</th>
            <th>제목</th>
            <th>작가</th>
            <th>출판사</th>
            <th>발행일</th>
            <th>대여상태</th>
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
        virtualNum = totalCount- (((pageNum -1) * pageSize ) + countNum++);
%>
        <tr>
        <td>
        
        <input type="checkbox" name="book" value="<%= dto.getBookCode() %>" />
        
        </td>
            <td><%= virtualNum %></td>
            <%--  
            <td align="left"> 
                 a href="View.jsp?num=<%= dto.getNum() %>"><%= dto.getTitle() %></a>   
            </td>
            --%>
            <td style="display:none;"><%= dto.getBookCode() %></td>
            <td align="center"><%= dto.getBookTitle() %></td>           
            <td align="center"><%= dto.getBookAuthor() %></td>   
            <td align="center"><%= dto.getPublisher() %></td>    
            <td align="center"><%= dto.getPublishDate() %></td>    
            <td style="display:none;"><%= dto.getBookStatus() %></td>
            <td align="center"><%= dto.getBookStatusNm() %></td>
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
        <%= BoardPageBoot.pagingStr(mapPaging) %> 
        </td>
                <!-- 글쓰기 버튼 
            <td><button type="button" onclick="location.href='Write.jsp';">글쓰기
                </button></td>-->
        </tr>
    </table>

</body>
</html>