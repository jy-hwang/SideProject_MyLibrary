package model2.mylibrary.board;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

import fileupload.FileUtil;
import utils.JSFunction;

@WebServlet("/mvcboard/edit.do")
public class EditController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("EditController doGet 메서드 호출");
		String idx = req.getParameter("idx");
		BoardDAO dao = new BoardDAO();
		BoardDTO dto = dao.selectView(idx);
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("/14MVCBoard/Edit.jsp").forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String saveDirectory = req.getServletContext().getRealPath("/Uploads");

		ServletContext application = this.getServletContext();

		int maxPostSize = Integer.parseInt(application.getInitParameter("maxPostSize"));

		MultipartRequest mr = FileUtil.uploadFile(req, saveDirectory, maxPostSize);

		if (mr == null) {

			JSFunction.alertBack(resp, "첨부파일이 제한용량(10MB) 를 초과합니다.");
			return;
		}

		int idx = Integer.parseInt(mr.getParameter("idx"));
		String prevOfile = mr.getParameter("prevOfile");
		String prevSfile = mr.getParameter("prevSfile");
		String name = mr.getParameter("name");
		String title = mr.getParameter("title");
		String content = mr.getParameter("content");

		HttpSession session = req.getSession();

		String pass = (String) session.getAttribute("pass");
		BoardDTO dto = new BoardDTO();
		dto.setBbsIdx(idx);
		dto.setTitle(title);
		dto.setContent(content);

		String fileName = mr.getFilesystemName("ofile");

		if (fileName != null) {

			String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
			String ext = fileName.substring(fileName.lastIndexOf("."));
			String newFileName = now + ext;

			File oldFile = new File(saveDirectory + File.separator + fileName);
			File newFile = new File(saveDirectory + File.separator + newFileName);
			oldFile.renameTo(newFile);

			dto.setOfile(fileName);
			dto.setSfile(newFileName);

			FileUtil.deleteFile(req, "/Uploads", prevSfile);

		} else {

			dto.setOfile(prevOfile);
			dto.setSfile(prevSfile);

		}

		BoardDAO dao = new BoardDAO();
		// int result = dao.updatePost(dto);

	}

}
