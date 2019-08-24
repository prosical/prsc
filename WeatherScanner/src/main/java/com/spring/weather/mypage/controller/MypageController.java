package com.spring.weather.mypage.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.spring.weather.board.model.BoardVO;
import com.spring.weather.board.service.IBoardService;
import com.spring.weather.commons.paging.PageCreator;
import com.spring.weather.commons.paging.SearchCriteria;
import com.spring.weather.likeit.model.LikeitVO;
import com.spring.weather.likeit.service.ILikeItService;
import com.spring.weather.member.model.MemberVO;
import com.spring.weather.member.service.IMemberService;
import com.spring.weather.mypage.service.IMypageService;


@RestController
@RequestMapping("/mypage")
public class MypageController {

	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	
	@Autowired
	private IMypageService mypageService;
	@Autowired
	private IMemberService memberService;
	@Autowired
	private IBoardService boardService;
	@Autowired
	private ILikeItService likeService;
	
////////////////////////////마이페이지////////////////////////////////////////////

	//회원정보 수정 페이지 진입
	@RequestMapping(value="/myModify", method=RequestMethod.GET)
	public ModelAndView myupdate(Model model, @RequestParam("id") String memberId) throws Exception {
	
	logger.info("method: get > /mypage/mymodify 요청");
	
	model.addAttribute("member", memberService.getMemberInfo(memberId));
	System.out.println(memberId);
	logger.info("클릭한 아이디 : " + memberId);
	
	return new ModelAndView("/mypage/myupdate");
	}
	
	//회원정보 수정 요청
	@RequestMapping(value="/myModify", method=RequestMethod.POST)
	public String myupdate(@RequestBody MemberVO member) throws Exception {
	
	logger.info("method: post > /mypage/mymodify");
	
	memberService.update(member);
	return "upSuccess";
	}


	//내가 찜한 게시물 페이지 요청
   @RequestMapping(value="/myLike", method=RequestMethod.GET)
   public ModelAndView myLike(SearchCriteria cri, Model model, @RequestParam("id") String memberId) throws Exception {

      logger.info("method: get > /mypage/myLike 요청");

      PageCreator pc = new PageCreator();
      pc.setCriteria(cri);
     // pc.setArticleTotalCount(mypageService.countLikeArticles(memberId));

      List<LikeitVO> boardNoArr = likeService.selectAllArticles(memberId);
      List<BoardVO> articles = new ArrayList<>();
          
		for(LikeitVO likeBoardNo : boardNoArr) {
			articles.add(boardService.getArticle(likeBoardNo.getBoardNo(), true));
		}
		
		model.addAttribute("pageCreator", pc);
		model.addAttribute("articles", articles);
		
      return new ModelAndView("mypage/mylike");
   }
   
   //내가 작성한 게시물 페이지 요청
   @RequestMapping(value="/myWrite", method=RequestMethod.GET)
   public ModelAndView myWrite(SearchCriteria cri, Model model, @RequestParam("id") String memberId) throws Exception {

      logger.info("method: get > /mypage/myWrite 요청");

      PageCreator pc = new PageCreator();
      pc.setCriteria(cri);
      // pc.setArticleTotalCount(mypageService.countLikeArticles(memberId));

      model.addAttribute("pageCreator", pc);
      model.addAttribute("articles", boardService.memberWriteAllArticles(memberId));
		
      return new ModelAndView("mypage/mywrite");
   }



}
