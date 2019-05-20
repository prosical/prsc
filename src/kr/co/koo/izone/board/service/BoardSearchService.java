package kr.co.koo.izone.board.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.koo.izone.board.model.BoardDAO;
import kr.co.koo.izone.board.model.BoardVO;

public class BoardSearchService implements IBoardService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		//System.out.println("검색시작");
		String sName = request.getParameter("title");
		
		BoardDAO dao = BoardDAO.getInstance();
		List<BoardVO> Sarticles = dao.getSearch(sName);
		request.setAttribute("Sarticles", Sarticles);
	}

}
