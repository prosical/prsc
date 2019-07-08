package com.spring.myapp.board.service;

import java.util.List;

import com.spring.myapp.board.model.BoardVO;
import com.spring.myapp.commons.paging.Criteria;
import com.spring.myapp.commons.paging.SearchCriteria;

public interface IBoardServise {

	void insert(BoardVO article) throws Exception;
	BoardVO getArticle(int boardNo, boolean trigger) throws Exception;
	void update(BoardVO article) throws Exception;
	void delete(int boardNo) throws Exception;
	
	List<BoardVO> getAllArticles() throws Exception;
	
	//페이징 처리
	List<BoardVO> listPaging(Criteria cri) throws Exception;
	//게시물 총  개수
	int countArticles() throws Exception;
	
	//검색 동적 SQL 처리
	List<BoardVO> listSearch(SearchCriteria cri) throws Exception;
	int countSearchArticles(SearchCriteria cri) throws Exception;
	

	
	
	
	
	
	
	
	
	
	
	
	////////////////////////////////////////
	//작성자 검색 게시물 수
	int countSearchedTitleArticles(SearchCriteria cri) throws Exception;
	//내용 검색 후 총 게시물 수 가져오기
	int countSearchedContentArticles(SearchCriteria cri) throws Exception;
	
	//제목으로 검색
	List<BoardVO> listSearchByTitle(SearchCriteria cri) throws Exception;
	//작성자로 검색
	List<BoardVO> listSearchByWriter(SearchCriteria cri) throws Exception;
	//내용으로 검색
	List<BoardVO> listSearchByContent(SearchCriteria cri) throws Exception;
	//내용+제목
	List<BoardVO> listSearchByTitleContent(SearchCriteria cri) throws Exception;
	int countSearchedArticles(SearchCriteria cri) throws Exception;
}
