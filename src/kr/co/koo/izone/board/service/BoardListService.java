package kr.co.koo.izone.board.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.koo.izone.board.model.BoardDAO;
import kr.co.koo.izone.board.model.BoardVO;

public class BoardListService implements IBoardService {
	
	//한페이지당 들어갈 게시물 수를 저장할 상수.
	private static final int MESSAGE_COUNT_PER_PAGE = 3;
	
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String strPage = request.getParameter("page");
		int currentPageNumber = 1;
		if(strPage != null) {
			currentPageNumber = Integer.parseInt(strPage);
		}
		
		BoardPageService articles = getBoardArticle(currentPageNumber);
		request.setAttribute("articles", articles);
	}
	
	//페이징 객체를 만들기 위한 메서드 선언.
	private BoardPageService getBoardArticle(int currentPageNumber) {
		BoardPageService articles = null;
		
		BoardDAO dao = BoardDAO.getInstance();
		
		//총 게시물 수 받아오기
		int messageTotalCount = dao.selectCount();
		
		int firstRow = 0, endRow = 0;
		
		List<BoardVO> articleList = null;
		
		if(messageTotalCount > 0) {
			firstRow = (currentPageNumber - 1) * MESSAGE_COUNT_PER_PAGE + 1;
			endRow = firstRow + MESSAGE_COUNT_PER_PAGE - 1;
			articleList = dao.getBoardArticles(firstRow, endRow);
		} else {
			currentPageNumber = 0;
		}
		
		articles = new BoardPageService(articleList, 
				messageTotalCount, currentPageNumber, 
				MESSAGE_COUNT_PER_PAGE, firstRow, endRow);
		
		return articles;
	}
	
}







