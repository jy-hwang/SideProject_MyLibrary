package model2.mylibrary.board;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model2.mylibrary.board.vo.BoardDTO;
import utils.BoardPageBoot;

@WebServlet("/board/list.do")
public class ListController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		System.out.println("======ListController doGet method======");

		BoardDAO dao = new BoardDAO();

		Map<String, Object> map = new HashMap<String, Object>();

		String searchField = req.getParameter("searchField");
		String searchWord = req.getParameter("searchWord");
		String boardId = req.getParameter("boardId");

		map.put("boardId", boardId);

		if (searchWord != null) {
			map.put("searchField", searchField);
			map.put("searchWord", searchWord);
		}
		int totalCount = dao.selectCount(map);

		/**/
		ServletContext application = getServletContext();

		int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
		int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));

		int pageNum = 1;

		String pageTemp = req.getParameter("pageNum");

		if (pageTemp != null && !pageTemp.equals("")) {
			pageNum = Integer.parseInt(pageTemp);
		}

		int start = (pageNum - 1) * pageSize;
		int end = pageSize;
		System.out.println("페이징 관련 변수 : " + " " + pageSize + " " + blockPage + " " + start + " " + end);
		map.put("start", start);
		map.put("end", end);

		List<BoardDTO> boardLists = dao.selectListPage(map);
		dao.close();

		Map<String, Object> pagingMap = new HashMap<String, Object>();

		pagingMap.put("totalCount", totalCount);
		pagingMap.put("pageSize", pageSize);
		pagingMap.put("blockPage", blockPage);
		pagingMap.put("pageNum", pageNum);
		
		StringBuffer reqUrl = new StringBuffer();
		StringBuffer forwardUrl = new StringBuffer();
		
		reqUrl.append("/board/list.do?boardId=");
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

		req.setAttribute("boardLists", boardLists);
		req.setAttribute("map", map);
		
		req.getRequestDispatcher(forwardUrl.toString()).forward(req, resp);

	}

}
