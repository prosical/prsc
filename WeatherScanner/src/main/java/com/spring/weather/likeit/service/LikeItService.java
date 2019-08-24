package com.spring.weather.likeit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.weather.board.repository.IBoardDAO;
import com.spring.weather.likeit.model.LikeitVO;
import com.spring.weather.likeit.repository.ILikeitDAO;

@Service
public class LikeItService implements ILikeItService {

	@Autowired
	private ILikeitDAO dao;
	
	private IBoardDAO boarddao;
	
	@Transactional
	@Override
	public void insertLike(LikeitVO vo) throws Exception {
		
		//int boardNo = vo.getBoardNo();
		
		//boarddao.deleteViewCnt(boardNo);
		dao.insertLike(vo);
		dao.pluslikeCnt(vo.getBoardNo());
		
	}

	@Transactional
	@Override
	public void deleteLike(LikeitVO vo) throws Exception {
		dao.deleteLike(vo);
		dao.minuslikeCnt(vo.getBoardNo());
//		boarddao.deleteViewCnt(vo.getBoardNo());
	}

	@Override
	public int isDuplicate(LikeitVO vo) throws Exception {
		return dao.isDuplicate(vo);
	}

	@Override
	public int countLike(int boardNo) throws Exception {
		return dao.countLike(boardNo);
	}

	@Override
	public void pluslikeCnt(int boardNo) throws Exception {
		dao.pluslikeCnt(boardNo);
		
	}

	@Override
	public void minuslikeCnt(int boardNo) throws Exception {
		dao.minuslikeCnt(boardNo);
		
	}

	@Override
	public void deleteAll(String memberId) throws Exception {
		dao.deleteAll(memberId);
		
	}

	@Override
	public List<LikeitVO> selectAllArticles(String memberId) throws Exception {
		return dao.selectAllArticles(memberId);
	}
	
	

}
