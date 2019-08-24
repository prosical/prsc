package com.spring.weather.likeit.service;

import java.util.List;

import com.spring.weather.likeit.model.LikeitVO;

public interface ILikeItService {

	public void insertLike(LikeitVO vo) throws Exception;
	public void deleteLike(LikeitVO vo) throws Exception;
	//테이블 내 게시물 존재 확인
	public int isDuplicate(LikeitVO vo) throws Exception;
	//좋아요 게시물은 board에서 작성
	//좋아요 개수 가져오기
	public int countLike(int boardNo) throws Exception;
	//좋아요 수 상승 메서드
	public void pluslikeCnt(int boardNo) throws Exception;
	//좋아요 수 감소 메서드
	public void minuslikeCnt(int boardNo) throws Exception;
	//회원 탈퇴용 모든 정보 삭제 메서드
	void deleteAll(String memberId) throws Exception;
	//마이페이지 좋아요 모아보기
	List<LikeitVO> selectAllArticles (String memberId) throws Exception;

}
