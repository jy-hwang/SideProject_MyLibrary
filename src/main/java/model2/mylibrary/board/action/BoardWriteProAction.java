package model2.mylibrary.board.action;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import fileupload.FileUtil;
import model2.mylibrary.board.service.BoardWriteProService;
import model2.mylibrary.board.vo.ActionForward;
import model2.mylibrary.board.vo.BoardDTO;
import utils.JSFunction;

public class BoardWriteProAction  implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

	ActionForward forward = null;
	BoardDTO boardDTO = null;
	String realFolder="";
	String saveFoler="/boardUpload";
	String boardId = request.getParameter("boardId");
	
	//int fileSize = 5 * 1024 * 1024;
	//ServletContext context = request.getServletContext();
	
	
	String saveDirectory = request.getServletContext().getRealPath("/Uploads");

	ServletContext application = request.getServletContext();

	int maxPostSize = Integer.parseInt(application.getInitParameter("maxPostSize"));

	MultipartRequest mr = FileUtil.uploadFile(request, saveDirectory, maxPostSize);
	if (mr == null) {
		JSFunction.alertLocation(response, "첨부 파일이 제한 용량을 초과합니다.", "../mvcboard/write.do");
		return forward;
	}

	BoardDTO dto = new BoardDTO();
	dto.setTitle(mr.getParameter("title"));
	dto.setContent(mr.getParameter("content"));

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

	}

	BoardWriteProService boardWriteProService = new BoardWriteProService();
	boolean isWriteSuccess = boardWriteProService.registArticle(boardDTO);
	
	if(!isWriteSuccess) {
		JSFunction.alertBack(response, "등록실패");
		
	}else {

		forward = new ActionForward();
		forward.setRedirect(true);
		
	}
	
	return forward;
	}
	
}
