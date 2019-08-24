package com.spring.weather.board.service;

import java.util.List;

import com.spring.weather.addfile.model.AddFileVO;
import com.spring.weather.board.model.BoardVO;
import com.spring.weather.commons.paging.Criteria;
import com.spring.weather.commons.paging.SearchCriteria;

public interface IBoardService {
	void insert(BoardVO article,AddFileVO file) throws Exception;
	void insert(BoardVO article) throws Exception;
	BoardVO getArticle(int boardNo, boolean trigger) throws Exception;
	
	void update(BoardVO article) throws Exception;
	void update(BoardVO article,AddFileVO file) throws Exception;
	
    void delete(int boardNo) throws Exception;
    
   /**/ List<BoardVO> getAllArticles() throws Exception;
    
    //페이징 처리
    List<BoardVO> listPaging(Criteria cri) throws Exception;
    //게시글의 총 게시물 수를 불러오기
    int countArticles() throws Exception;
    
    //검색 동적 SQL처리
    List<BoardVO> listSearch(SearchCriteria cri) throws Exception;
    int countSearchArticles(SearchCriteria cri) throws Exception;
    
    //좋아요 개수
    int countLike(int boardNo) throws Exception;
    
	int countLiArticle() throws Exception;
	
	List<BoardVO> memberWriteAllArticles(String memberId) throws Exception;
	

//--------------------------mypage----------------------------------------     
    
    //내가 작성한 게시글 불러오기
//    List<BoardVO> getMyArticle(SearchCriteria cri) throws Exception;
//    int countMyArticle(SearchCriteria cri) throws Exception;
    //내가 찜한 게시글 불러오기
    List<BoardVO> getLiArticle(SearchCriteria cri) throws Exception;
   
}
