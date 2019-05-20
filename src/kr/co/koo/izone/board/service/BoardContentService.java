package kr.co.koo.izone.board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.koo.izone.board.model.BoardDAO;
import kr.co.koo.izone.board.model.BoardVO;

public class BoardContentService implements IBoardService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		BoardDAO dao = BoardDAO.getInstance();
		String bId = request.getParameter("bId");
		//dao메서드를 통해 선택된게시물 정보를 SELECT해서 리턴 받으세요.
		BoardVO board = dao.getBoardContent(bId);
		//request객체에 조회된 게시글정보를 저장하세요. EL변수: "contents"
		request.setAttribute("contents", board);

	}

}
