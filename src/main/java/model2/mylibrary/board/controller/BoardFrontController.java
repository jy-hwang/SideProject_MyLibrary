package model2.mylibrary.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model2.mylibrary.board.action.Action;
import model2.mylibrary.board.action.BoardListAction;
import model2.mylibrary.board.action.BoardWriteProAction;
import model2.mylibrary.board.vo.ActionForward;

@WebServlet("*.bo")
public class BoardFrontController extends HttpServlet {

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		ActionForward forward = null;
		Action action = null;

		System.out
				.println("RequestURI : " + RequestURI + ", contextPath :  " + contextPath + " , command :  " + command);

		if (command.equals("/boardWriteForm.bo")) {
			forward = new ActionForward();
			forward.setPath("/board/qna_board_write.jsp");
		} else if (command.equals("/boardWritePro.bo")) {
			action = new BoardWriteProAction();
			try {

				forward = action.execute(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/boardList.bo")) {
			action = new BoardListAction();
			try {

				forward = action.execute(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		if (forward != null) {
			if (forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);

			}
		}

	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

}
