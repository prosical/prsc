package com.spring.weather.reply.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.spring.weather.commons.paging.Criteria;
import com.spring.weather.commons.paging.PageCreator;
import com.spring.weather.reply.model.ReplyVO;
import com.spring.weather.reply.service.IReplyService;

@RestController
@RequestMapping("/replies")
public class ReplyController {

	private static final Logger logger = LoggerFactory.getLogger(ReplyController.class);

	@Autowired
	private IReplyService replyService;

	@RequestMapping(value="", method=RequestMethod.GET)
	public String register() throws Exception{


		return "regSuccess";
	}

	//댓글 등록처리
	/*
	 # @RequestBody : 클라이언트가 전송한 JSON데이터를 자바 객채로 변환해주는 어노테이션
	 */
	@RequestMapping(value="", method=RequestMethod.POST)
	public String register(@RequestBody ReplyVO reply) throws Exception{
		logger.info("/replies : POST 요청발생!");
		System.out.println("reply: "+reply);
		replyService.insert(reply);
		logger.info(reply.toString() + "댓글 등록 성공!");
		return "regSuccess";
	}

	//댓글 목록 가져오기
	/*
	 # @PathVariable: REST방식의 URI 경로에서 원하는 데이터를 추출할 떄 사용.
	 */
	@RequestMapping(value="/all/{boardNo}", method=RequestMethod.GET)
	public List<ReplyVO> list(@PathVariable int boardNo) throws Exception{
		logger.info("/replies/all/" + boardNo +" : GET 요청발생!");
		replyService.list(boardNo);
		return replyService.list(boardNo);
	}



	@RequestMapping(value="/{boardNo}/{page}", method=RequestMethod.GET)
	//페이징 처리된 댓글 목록 가져오기
	public Map<String, Object> listPaging (@PathVariable("boardNo") int boardNo,
			@PathVariable("page") int page)throws Exception{
		Criteria cri = new Criteria();
		cri.setPage(page);
		List<ReplyVO> replies = replyService.listPaging(boardNo, cri);

		PageCreator pc = new PageCreator();
		pc.setCriteria(cri);
		pc.setArticleTotalCount(replyService.countReplies(boardNo));

		int i = 0;
		for(ReplyVO list : replies){
			System.out.println(i++ +"  , "+list.getReplyWriter());
		}

		Map<String, Object> datas = new HashMap<>();
		datas.put("replies", replies);
		datas.put("pageCreator", pc);

		return datas;
	}





	//댓글 삭제 요청
	@RequestMapping(value="/{replyNo}", method=RequestMethod.DELETE)
	public String delete(@PathVariable int replyNo,
			@RequestBody ReplyVO reply) throws Exception{
		logger.info("/replies/" + replyNo +" : DELETE 요청발생!");
		replyService.delete(replyNo, reply.getBoardNo());
		replyService.deleteViewCnt(reply.getBoardNo());
		return "delSuccess";
	}

	//댓글 수정요청
	@RequestMapping(value="/{replyNo}", method=RequestMethod.PUT)
	public String update(@PathVariable int replyNo, 
			@RequestBody ReplyVO reply) throws Exception{
		logger.info("/replies/" + replyNo +" : PUT 요청발생!");
		reply.setReplyNo(replyNo);

		replyService.update(reply);
		replyService.deleteViewCnt(reply.getBoardNo());
		return "updateSuccess";
	}










}
