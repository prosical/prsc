package com.spring.weather.reply.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.weather.board.repository.IBoardDAO;
import com.spring.weather.commons.paging.Criteria;
import com.spring.weather.reply.model.ReplyVO;
import com.spring.weather.reply.repository.IReplyDAO;


@Service
public class ReplyService implements IReplyService{
	
	@Autowired
	private IReplyDAO replyDAO;
	@Autowired
	private IBoardDAO boardDAO;
	
	
	@Override
	public List<ReplyVO> list(int boardNo) throws Exception {
		
		return replyDAO.list(boardNo);
	}
	
	@Transactional
	@Override
	public void insert(ReplyVO reply) throws Exception {
		replyDAO.insert(reply);
		boardDAO.updateReplyCnt(reply.getBoardNo(), 1);
		
		
	}

	@Override
	public void update(ReplyVO reply) throws Exception {
		replyDAO.update(reply);
		
	}
	@Transactional
	@Override
	public void delete(int replyNo, int boardNo) throws Exception {
		boardDAO.updateReplyCnt(boardNo, -1);
		replyDAO.delete(replyNo);
		
	}

	@Override
	   public List<ReplyVO> listPaging(int boardNo, Criteria cri) throws Exception {
	      
	      //Mapper.xml에 여러 데이터를 보낼 때는 Map데이터로 포장해서 전달한다.
	      Map<String, Object> datas = new HashMap<>();
	      datas.put("boardNo", boardNo);
	      datas.put("criteria", cri);
	      
	      return replyDAO.listPaging(datas);
	   }

	@Override
	public int countReplies(int boardNo) throws Exception {
	
		return replyDAO.countReplies(boardNo);
	}

	@Override
	public void deleteAllReply(int boardNo) throws Exception {
		
		replyDAO.deleteAllReply(boardNo);
	}

	@Override
	public List<ReplyVO> listPaging(Map<String, Object> datas) throws Exception {
		return replyDAO.listPaging(datas);
	}

	@Override
	public void deleteViewCnt(int boardNo) throws Exception {
		boardDAO.deleteViewCnt(boardNo);
	}

	
}
