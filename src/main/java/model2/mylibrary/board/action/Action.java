package model2.mylibrary.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model2.mylibrary.board.vo.ActionForward;

public interface Action {

	ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	
}
