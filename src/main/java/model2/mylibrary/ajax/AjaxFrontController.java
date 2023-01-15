package model2.mylibrary.ajax;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import model2.mylibrary.cmmn.vo.CmmnDAO;
import model2.mylibrary.cmmn.vo.CmmnDTO;

@WebServlet("*.ajax")
public class AjaxFrontController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		System.out.println("AjaxFrontController");

		request.setCharacterEncoding("UTF-8");
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		
		System.out.println("command" + command);
		JSONArray jarray = new JSONArray();
		if (command.equals("/cmmnChildList.ajax")) {
			System.out.println("cmmnChildList");
			String parentCode = request.getParameter("parentCode");
			System.out.println("parentCode : " + parentCode);
			CmmnDAO cmmnDAO = new CmmnDAO();
			ArrayList<CmmnDTO> childList = cmmnDAO.selectChildCodeList(parentCode);
			
		
			for(CmmnDTO c : childList) {
				JSONObject jobj = new JSONObject();
				System.out.println(c);
				jobj.put("cmmnCode", c.getCmmnCode());
				jobj.put("cmmnName", c.getCmmnName());
				jobj.put("useYn", c.getUseYn());
				
				jarray.add(jobj);	
			}
			cmmnDAO.close();
			//HashMap<String, Object> map = new HashMap<String, Object>();
			
			
		} else if (command.equals("/cmmnOneCode.ajax")) {
			System.out.println("cmmnOneCode");
			String cmmnCode = request.getParameter("cmmnCode");
			System.out.println("cmmnCode : " + cmmnCode);
			CmmnDAO cmmnDAO = new CmmnDAO();
			CmmnDTO dto = cmmnDAO.selectCodeOne(cmmnCode);
			
			
			JSONObject jobj = new JSONObject();

			jobj.put("parentCode", dto.getParentCode());
			jobj.put("cmmnCode", dto.getCmmnCode());
			jobj.put("cmmnName", dto.getCmmnName());
			jobj.put("useYn", dto.getUseYn());
			jobj.put("description", dto.getDesc());
						
			jarray.add(jobj);	
			
			cmmnDAO.close();
			
		} 
		
		System.out.println("===================");
		System.out.println("jarray.toJSONString()"+jarray.toJSONString());		
		System.out.println("===================");
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/x-json");
		response.getWriter().print(jarray.toJSONString());
	}
	
}
