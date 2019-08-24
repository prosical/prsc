package com.spring.weather.board.repository;

import java.util.List;

import com.spring.weather.board.model.BoardVO;
import com.spring.weather.commons.paging.Criteria;
import com.spring.weather.commons.paging.SearchCriteria;

public interface IBoardDAO {

	
	void insert(BoardVO article) throws Exception;
	BoardVO getArticle(int boardNo) throws Exception;
	void update(BoardVO article) throws Exception;
    void delete(int boardNo) throws Exception;
    
 /**/ //게시글 전체목록 불러오기
    List<BoardVO> getAllArticles() throws Exception;
    
    //게시글 페이지별로 불러오기
    List<BoardVO> listPaging(Criteria cri) throws Exception;
    //게시글의 총 게시물 수를 불러오기
    int countArticles() throws Exception;
    
  //검색 동적 SQL처리
    List<BoardVO> listSearch(SearchCriteria cri) throws Exception;
    int countSearchArticles(SearchCriteria cri) throws Exception;
    
    //조회수 상승 처리
    void updateViewCnt(int boardNo) throws Exception;
    //조회수 하강 처리
    void deleteViewCnt(int boardNo) throws Exception;
    
    //댓글 개수 상승, 하락 처리
    void updateReplyCnt(int boardNo, int count) throws Exception;
    
    void deleteAll(String memberId) throws Exception;
    
    //좋아요 개수
    int countLike(int boardNo) throws Exception;
    
////////////////////////////mypage----------------------------------------    
    
//    //내가 작성한 게시글 불러오기
//    List<BoardVO> getMyArticle(SearchCriteria cri) throws Exception;
//    int countMyArticle(SearchCriteria cri) throws Exception;
//    
//    //내가 찜한 게시글 불러오기
    List<BoardVO> getLiArticle(SearchCriteria cri) throws Exception;
	int countLiArticle() throws Exception;
	
	List<BoardVO> memberWriteAllArticles(String memberId) throws Exception;
}


