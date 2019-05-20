package kr.co.koo.izone.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.koo.izone.board.model.BoardDAO;
import kr.co.koo.izone.board.model.BoardVO;
import kr.co.koo.izone.board.service.BoardContentService;
import kr.co.koo.izone.board.service.BoardDeleteService;
import kr.co.koo.izone.board.service.BoardListService;
import kr.co.koo.izone.board.service.BoardSearchService;
import kr.co.koo.izone.board.service.BoardUpdateService;
import kr.co.koo.izone.board.service.BoardWriteService;
import kr.co.koo.izone.board.service.IBoardService;

import java.util.*;

@WebServlet("*.izone")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public BoardController() {
        super();        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("get요청 발생!! doGet호출!");
		doRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("post요청 발생!! doPost호출!");
		doRequest(request, response);
	}

	private void doRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("요청위임됨! doRequest호출!!");
		request.setCharacterEncoding("utf-8");
		
		String uri = request.getRequestURI();
		
		//컨트롤러가 안내해줄 UI페이지의 경로정보를 담을 변수.
		String viewPage = null;
		
		IBoardService sv = null;
		
		if(uri.equals("/izone/board/BList.izone")) {
			sv = new BoardListService();
			sv.execute(request, response);
			viewPage = "/board/board_list.jsp";
		} else if(uri.equals("/izone/board/BWriteView.izone")) {
			viewPage = "/board/board_write_view.jsp";
		} else if(uri.equals("/izone/board/BWrite.izone")) {
			sv = new BoardWriteService();
			sv.execute(request, response);
			viewPage = "/board/BList.izone";
		} else if(uri.equals("/izone/board/BContent.izone")) {
			sv = new BoardContentService();
			sv.execute(request, response);
			viewPage = "/board/board_content_view.jsp";
		} else if(uri.equals("/izone/board/BUpdateView.izone")) {
			sv = new BoardContentService();
			sv.execute(request, response);
			viewPage = "/board/board_update_view.jsp";
		} else if(uri.equals("/izone/board/BUpdate.izone")) {
			sv = new BoardUpdateService();
			sv.execute(request, response);
			viewPage = "/board/BList.izone";
		} else if(uri.equals("/izone/board/BDelete.izone")) {
			sv = new BoardDeleteService();
			sv.execute(request, response);
			viewPage = "/board/BList.izone";
		} else if(uri.equals("/izone/board/BSearch.izone")) {
			sv = new BoardSearchService();
			sv.execute(request, response);
			viewPage = "/board/board_search_list.jsp";
	}
		
		//페이지 강제이동 forward
		RequestDispatcher dp = request.getRequestDispatcher(viewPage);
		dp.forward(request, response);
		
	}

}



