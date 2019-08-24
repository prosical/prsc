package com.spring.weather.likeit.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.spring.weather.board.controller.BoardController;
import com.spring.weather.likeit.model.LikeitVO;
import com.spring.weather.likeit.service.ILikeItService;
import com.spring.weather.member.model.MemberVO;

@RestController
@RequestMapping("/likeit")
public class LikeitController {

	@Autowired
	private ILikeItService service;
	
	private static final Logger logger = LoggerFactory.getLogger(LikeitController.class);
	
	@PostMapping("/insertLike")
	public String likeitIn(@RequestParam("boardNo") int boardNo,HttpSession session, Model model) throws Exception {
		
		logger.info("likeCon");
		LikeitVO vo = new LikeitVO();
	
		MemberVO member = (MemberVO) session.getAttribute("login");
		
		logger.info("member: "+member);
		
		vo.setBoardNo(boardNo);
		vo.setMemberId(member.getMemberId());
		
		logger.info("vo: "+vo);
		
		if(service.isDuplicate(vo) == 0) {
			service.insertLike(vo);
//			service.pluslikeCnt(vo.getBoardNo());
			
			return "insSuccess";
		} else {
			service.deleteLike(vo);
//			service.minuslikeCnt(vo.getBoardNo());
			
			return "delSuccess";
		}
		
		
	}
	
	
	
}
