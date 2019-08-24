package com.spring.weather.mypage.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.weather.board.model.BoardVO;
import com.spring.weather.commons.paging.SearchCriteria;
import com.spring.weather.mypage.repository.IMypageDAO;

@Service
public class MypageService implements IMypageService{

	
	private IMypageDAO mypageDAO;
	
	
	//내가 찜한 게시글 불러오기
	@Override
	public List<BoardVO> likeList(String memberId) throws Exception {
		
		return mypageDAO.likeList(memberId);
		
	}
	
	//로그인한 아이디가 찜한 게시물 갯수 구하기
	@Override
	public int countLikeArticles(String memberId) throws Exception {
		
		return mypageDAO.countLikeArticles(memberId);
	}
	
	
		
}
