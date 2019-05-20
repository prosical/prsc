package kr.co.koo.izone.board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.koo.izone.board.model.BoardDAO;

public class BoardDeleteService implements IBoardService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String bNum = request.getParameter("bId");
		
		BoardDAO dao = BoardDAO.getInstance();
		dao.deleteArticle(bNum);

	}

}
