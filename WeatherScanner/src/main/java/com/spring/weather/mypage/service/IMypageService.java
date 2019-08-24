package com.spring.weather.mypage.service;

import java.util.List;

import com.spring.weather.board.model.BoardVO;
import com.spring.weather.commons.paging.SearchCriteria;

public interface IMypageService {

	////내가 찜한 게시글 불러오기
	List<BoardVO> likeList(String memberId) throws Exception;
	
	//로그인한 아이디가 찜한 게시물 갯수 구하기
	int countLikeArticles(String memberId) throws Exception;
	
}
