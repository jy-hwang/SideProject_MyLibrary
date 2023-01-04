package model2.mylibrary.board;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model2.mylibrary.board.vo.BoardDTO;

@WebServlet("/mvcboard/view.do")
public class ViewController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BoardDAO dao = new BoardDAO();

		String idx = req.getParameter("idx");

		dao.updateVisitCount(idx);
		BoardDTO dto = dao.selectView(idx);
		dao.close();

		dto.setContent(dto.getContent().replaceAll("\r\n", "<br/"));

		String ext = null, fileName = dto.getSfile();

		if (fileName != null) {
			ext = fileName.substring(fileName.lastIndexOf(".") + 1);
		}

		String[] mimeStr = { "jpg", "png", "gif" };
		boolean isImage = false;
		List<String> mimeList = Arrays.asList(mimeStr);

		if (mimeList.contains(ext)) {
			isImage = true;
		}

		req.setAttribute("isImage", isImage);
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("/14MVCBoard/View.jsp").forward(req, resp);

	}

}
