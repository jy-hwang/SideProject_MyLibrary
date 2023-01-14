package model2.mylibrary.board.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model2.mylibrary.board.service.BoardListService;
import model2.mylibrary.board.vo.ActionForward;
import model2.mylibrary.board.vo.BoardDTO;
import utils.BoardPageBoot;

public class BoardListAction  implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		//BoardDAO2 dao = new BoardDAO2();
		
		ArrayList<BoardDTO> articleList = new ArrayList<BoardDTO>();
		
		Map<String, Object> map = new HashMap<String, Object>();

		String searchField = request.getParameter("searchField");
		String searchWord = request.getParameter("searchWord");
		String boardId = request.getParameter("boardId");

		System.out.println("boardId" + boardId);
		map.put("boardId", boardId);

		if (searchWord != null) {
			map.put("searchField", searchField);
			map.put("searchWord", searchWord);
		}
		BoardListService boardListService = new BoardListService();
		int totalCount = boardListService.getListCount(map);
		

		/**/
		ServletContext application = request.getServletContext();

		int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
		int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));

		int pageNum = 1;

		String pageTemp = request.getParameter("pageNum");

		if (pageTemp != null && !pageTemp.equals("")) {
			pageNum = Integer.parseInt(pageTemp);
		}

		int start = (pageNum - 1) * pageSize;
		int end = pageSize;
		System.out.println("페이징 관련 변수 : " + " " + pageSize + " " + blockPage + " " + start + " " + end);
		map.put("start", start);
		map.put("end", end);

		articleList = boardListService.getArticleList(map);
		//dao2.close();

		Map<String, Object> pagingMap = new HashMap<String, Object>();

		pagingMap.put("totalCount", totalCount);
		pagingMap.put("pageSize", pageSize);
		pagingMap.put("blockPage", blockPage);
		pagingMap.put("pageNum", pageNum);
		
		StringBuffer reqUrl = new StringBuffer();
		StringBuffer forwardUrl = new StringBuffer();
		
		reqUrl.append("/boardList.bo?boardId=");
		forwardUrl.append("/board/board");
		
		if (boardId.equals("10")) {
			reqUrl.append(10);
			forwardUrl.append("Notice");
		} else if (boardId.equals("20")) {
			reqUrl.append(20);
			forwardUrl.append("Faq");
		} else if (boardId.equals("30")) {
			reqUrl.append(30);
			forwardUrl.append("Qna");
		} else if (boardId.equals("40")) {
			reqUrl.append(40);
			forwardUrl.append("BookRequest");
		}
		forwardUrl.append(".jsp");
		pagingMap.put("reqUrl", reqUrl);
		pagingMap.put("boardPagingYn", "Y");
		String pagingImg = BoardPageBoot.pagingStr(pagingMap);

		map.put("pagingImg", pagingImg);
		map.put("totalCount", totalCount);
		map.put("pageSize", pageSize);
		map.put("pageNum", pageNum);

		request.setAttribute("boardLists", articleList);
		request.setAttribute("map", map);
		ActionForward forward = new ActionForward();	
		
		//req.getRequestDispatcher(forwardUrl.toString()).forward(req, resp);
		System.out.println("=============================");
		System.out.println(forwardUrl.toString());
		forward.setPath(forwardUrl.toString());
		
	
	
	return forward;
	}
	
}
