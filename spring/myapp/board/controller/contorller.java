package com.spring.myapp.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.myapp.board.model.BoardVO;
import com.spring.myapp.board.service.IBoardServise;
import com.spring.myapp.commons.paging.Criteria;
import com.spring.myapp.commons.paging.PageCreator;
import com.spring.myapp.commons.paging.SearchCriteria;

@Controller
@RequestMapping("/board")
public class BoardController { 

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private IBoardServise service;
	
	//게시글 목록 요청 처리 메서드
	//페이징 처리 전
	/*@RequestMapping(value="/list", method = RequestMethod.GET)
	public String list(Model model) throws Exception {
		logger.info("/board/list request");
		model.addAttribute("articles", service.getAllArticles());
		return "/board/list";
	}*/
	  
	//페이징 처리 후 게시물 열람 요청
	/*@RequestMapping(value="/list", method = RequestMethod.GET)
	public String list(Criteria cri, Model model) throws Exception {
		logger.info("/board/list: get요청 발생");
		
		PageCreator pc = new PageCreator();
		pc.setCriteria(cri);
		pc.setArticleTotalCount(service.countArticles());
		
		model.addAttribute("articles", service.listPaging(cri));
		model.addAttribute("pageCreator", pc);
		model.addAttribute("cri", cri);
		return "board/list";
	}*/
	
	//검색 처리 후 게시글 목록 불러오기
	/*@RequestMapping(value="/list", method = RequestMethod.GET)
	public String list(SearchCriteria cri, Model model) throws Exception {
		logger.info("/board/list: get요청 발생");
		
		PageCreator pc = new PageCreator();
		pc.setCriteria(cri);
		
		if(cri.getCondition().equals("title")) {
			model.addAttribute("articles", service.listSearchByTitle(cri));
			pc.setArticleTotalCount(service.countSearchedArticles(cri));
		} else if(cri.getCondition().equals("writer")) {
			model.addAttribute("articles", service.listSearchByWriter(cri));
			pc.setArticleTotalCount(service.countSearchedTitleArticles(cri));
		} else if(cri.getCondition().equals("content")) {
			model.addAttribute("articles", service.listSearchByContent(cri));
		} else if(cri.getCondition().equals("title+writer")){
			System.out.println("title+writer");
			model.addAttribute("articles", service.listSearchByTitleContent(cri));
		} else {
			model.addAttribute("articles", service.listPaging(cri));
		}
		
		model.addAttribute("pageCreator", pc);
		//model.addAttribute("cri", cri);
		return "board/list";
	}*/ 
	
	//검색 후 게시물 열람 요청
		@RequestMapping(value="/list", method = RequestMethod.GET)
		public String list(SearchCriteria cri, Model model) throws Exception {
			logger.info("/board/list: get요청 발생");
			
			PageCreator pc = new PageCreator();
			pc.setCriteria(cri);
			pc.setArticleTotalCount(service.countSearchArticles(cri));
			
			model.addAttribute("articles", service.listSearch(cri));
			model.addAttribute("pageCreator", pc);
			return "board/list";
		}
		
	//게시글 작성화면 열람
	@RequestMapping(value="/write", method = RequestMethod.GET)
	public String write(Model model) {
		
		logger.info("method: get > /board/write");
		return "/board/write";
	}
	
	//게시글 등록 요청
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String write(BoardVO article, RedirectAttributes redirectt,Model model) throws Exception {
		logger.info("method: post > /board/write");
		logger.info(article.toString());
		service.insert(article);
		redirectt.addFlashAttribute("message", "regSuccess");
		return "redirect:/board/list";
	}
	
	//게시글 상세보기
	@RequestMapping(value="/content", method=RequestMethod.GET)
	public String viewContent(@RequestParam("boardNo") int boardNo, @ModelAttribute("criteria") SearchCriteria cri,
			Model model) throws Exception {
		model.addAttribute("article", service.getArticle(boardNo, true));
		return "/board/content";
	}
	
	//게시물 수정 폼
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public String modifyform(@RequestParam("boardNo") int boardNo, 
			 @ModelAttribute("pagecreator") PageCreator pc, @ModelAttribute("criteria") SearchCriteria cri, Model model) throws Exception {
		
		model.addAttribute("article", service.getArticle(boardNo, false));
		return "/board/modify";
	}  
	
	//게시물 수정 저장
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	   public String modify(BoardVO article,
	         SearchCriteria cri,
	         RedirectAttributes redirectAttributes) throws Exception {

	      logger.info("method: post > /board/modify");
	      service.update(article);
	      redirectAttributes.addAttribute("page", cri.getPage())
	       					.addAttribute("countPerPage", cri.getCountPerPage())
	      					.addAttribute("condition", cri.getCondition())
	      					.addAttribute("keyword", cri.getKeyword())
	      					.addFlashAttribute("message", "modSuccess");

	      return "redirect:/board/list";
	   }

	//삭제
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public String delete(@RequestParam("boardNo") int boardNo, Criteria cri, RedirectAttributes redirect) throws Exception {
		service.delete(boardNo);
		
		redirect.addAttribute("page", cri.getPage());
	    redirect.addAttribute("countPerPage", cri.getCountPerPage());
		redirect.addFlashAttribute("message", "delSuccess");
		return "redirect:/board/list";
	}
	
	//게시물 제목으로 검색
	
	
	
}
