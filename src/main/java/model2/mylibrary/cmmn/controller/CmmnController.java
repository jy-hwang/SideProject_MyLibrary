package model2.mylibrary.cmmn.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model2.mylibrary.cmmn.vo.CmmnDAO;
import model2.mylibrary.cmmn.vo.CmmnDTO;

@WebServlet("/cmmn/list.do")
public class CmmnController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		System.out.println("======CmmnController doGet method======");

		CmmnDAO dao = new CmmnDAO();
		
		ArrayList<CmmnDTO> cmmnList = dao.selectParentCodeList();
		
		dao.close();
		
		req.setAttribute("cmmnList", cmmnList);
		
		req.getRequestDispatcher("/cmmn/cmmnList.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		super.doPost(req, resp);
	}
	
}
