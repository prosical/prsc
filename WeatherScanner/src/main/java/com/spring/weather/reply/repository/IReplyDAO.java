package com.spring.weather.reply.repository;

import java.util.List;
import java.util.Map;

import com.spring.weather.commons.paging.Criteria;
import com.spring.weather.reply.model.ReplyVO;

public interface IReplyDAO {
	
	//댓글목록불러오기
	List<ReplyVO> list(int boardNo) throws Exception;
	//댓글 쓰기 기능
	void insert(ReplyVO reply) throws Exception;
	//댓글 수정 기능
	void update(ReplyVO reply) throws Exception;
	//댓글 삭제 기능
	void delete(int replyNo) throws Exception;
	//게시물 삭제를 위해 댓글 전부 삭제 기능
	void deleteAllReply(int BoardNo) throws Exception;
	
	//페이징처리된 게시글 목록 불러오기 기능
	List<ReplyVO> listPaging(int boardNo, Criteria cri) throws Exception;
	
	//해당 게시물 총 댓글 갯수
	int countReplies(int boardNo) throws Exception;
	
	//페이징처리된 게시글 목록 불러오기 기능
	   List<ReplyVO> listPaging(Map<String, Object> datas) throws Exception;
}
