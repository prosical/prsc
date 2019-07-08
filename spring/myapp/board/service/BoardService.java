package com.spring.myapp.board.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.myapp.board.model.BoardVO;
import com.spring.myapp.board.repository.IBoardDAO;
import com.spring.myapp.commons.paging.Criteria;
import com.spring.myapp.commons.paging.SearchCriteria;
import com.spring.myapp.reply.repository.IReplyDAO;

@Service
public class BoardService implements IBoardServise {

	@Autowired
	private IBoardDAO dao;
	
	@Autowired
	private IReplyDAO replydao;
	
	@Override
	public void insert(BoardVO article) throws Exception {
		dao.insert(article);
	}

	@Transactional
	@Override
	public BoardVO getArticle(int boardNo, boolean trigger) throws Exception {
		BoardVO article = dao.getArticle(boardNo);
		
		if(trigger) {
		String content = article.getContent().replace("\n", "<br>")
				 		 					 .replace("\u0020", "&nbsp;");
		article.setContent(content);
		}
		dao.updateViewCnt(boardNo);
		return article;
	}

	@Override
	public void update(BoardVO article) throws Exception {
		dao.update(article);
	}
	
	@Transactional
	@Override
	public void delete(int boardNo) throws Exception {
		replydao.deleteAll(boardNo);
		dao.delete(boardNo);
	}

	@Override
	public List<BoardVO> getAllArticles() throws Exception {
		return dao.getAllArticles();
	}

	@Override
	public List<BoardVO> listPaging(Criteria cri) throws Exception {
		return dao.listPaging(cri);
	}

	@Override
	public int countArticles() throws Exception {
		return dao.countArticles();
	}
	
	@Override
	public List<BoardVO> listSearch(SearchCriteria cri) throws Exception {
		
		List<BoardVO> list = dao.listSearch(cri);
		
		//1일 이내에 쓰여진 게시물에만 new를 붙이는 처리
		for(BoardVO boardVO : list) {
			//게시물 목록을 요청한 시간 - 게시물 등록 시간 < 1일 => newMark true
			
			long now = System.currentTimeMillis(); //현재 시간 읽기
			//Date date = boardVO.getRegDate(); //게시물 등록 시간 읽기
			long regDate = boardVO.getRegDate().getTime();
			
			//하루의 밀리초
			long oneDayMillis = 60 * 60 * 24 * 1000;
			
			if(now - regDate <= oneDayMillis) {
				boardVO.setNewMark(true);
			}
		}
		return list;
	}

	@Override
	public int countSearchArticles(SearchCriteria cri) throws Exception {
		return dao.countSearchArticles(cri);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
///////////////////////////////////////////////////////////////////////////////////////////////////////
	@Override
	public List<BoardVO> listSearchByTitle(SearchCriteria cri) throws Exception {
		return dao.listSearchByTitle(cri);
	}

	@Override
	public int countSearchedArticles(SearchCriteria cri) throws Exception {
		return dao.countSearchedArticles(cri);
	}

	@Override
	public List<BoardVO> listSearchByWriter(SearchCriteria cri) throws Exception {
		return dao.listSearchByWriter(cri);
	}

	@Override
	public List<BoardVO> listSearchByContent(SearchCriteria cri) throws Exception {
		return dao.listSearchByContent(cri);
	}

	@Override
	public List<BoardVO> listSearchByTitleContent(SearchCriteria cri) throws Exception {
		return dao.listSearchByTitleContent(cri);
	}

	@Override
	public int countSearchedTitleArticles(SearchCriteria cri) throws Exception {
		return dao.countSearchedTitleArticles(cri);
	}

	@Override
	public int countSearchedContentArticles(SearchCriteria cri) throws Exception {
		return dao.countSearchedContentArticles(cri);
	}


}
