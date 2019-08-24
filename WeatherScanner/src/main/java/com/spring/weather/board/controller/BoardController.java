package com.spring.weather.board.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
//import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.weather.addfile.model.AddFileVO;
import com.spring.weather.addfile.service.IAddFileService;
import com.spring.weather.board.model.BoardVO;
import com.spring.weather.board.service.IBoardService;
import com.spring.weather.commons.paging.PageCreator;
import com.spring.weather.commons.paging.SearchCriteria;
import com.spring.weather.likeit.service.ILikeItService;
import com.spring.weather.member.model.MemberVO;

@Controller
@RequestMapping("/board")
public class BoardController {


	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Autowired
	private IBoardService service;
	@Autowired
	ILikeItService likeservice;
	@Autowired
	private IAddFileService fileservice;
	
	
	//게시글 목록페이지 열람요청 처리 메서드
	/*
	//페이징 처리 전
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String list(Model model) throws Exception {

		logger.info("/board/list request~~");

		model.addAttribute("articles", service.getAllArticles());

		return "board/list";
	}
	 */

	//페이징 처리 후 게시글 목록 요청
	/*@RequestMapping(value="/list", method=RequestMethod.GET)
	public String list(Criteria cri, Model model) throws Exception {

		logger.info("/board/list : GET요청 발생!");

		PageCreator pc = new PageCreator();
		pc.setCriteria(cri);
		pc.setArticleTotalCount(service.countArticles());

		model.addAttribute("articles", service.listPaging(cri));
		model.addAttribute("pageCreator", pc);

		return "board/list";
	}*/

	//검색 처리 후 게시글 목록 불러오기
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String list(SearchCriteria cri, HttpSession session, Model model) throws Exception {

		logger.info("/board/list : GET요청 발생!");

		MemberVO member = (MemberVO) session.getAttribute("login");

		if(member != null) {
			model.addAttribute("trig", member.isTriggerAd());
		} else {
			model.addAttribute("trig", null);
		}
		model.addAttribute("member", member);
		
		PageCreator pc = new PageCreator();
		pc.setCriteria(cri);
		pc.setArticleTotalCount(service.countSearchArticles(cri));

		/*String condition = cri.getCondition();

		if(condition.equals("title")) {
			pc.setArticleTotalCount(service.countSearchedArticles(cri));
			model.addAttribute("articles", service.listSearchByTitle(cri));
		} else if(condition.equals("writer")) {
			pc.setArticleTotalCount(service.countSearchedArticles2(cri));
			model.addAttribute("articles", service.listSearchByWriter(cri));
		} else {
			pc.setArticleTotalCount(service.countArticles());
			model.addAttribute("articles", service.listPaging(cri));
		}*/
		
		//맵으로 묶어서 보내기
		
		/*
		Map<String, Object> articles = new HashMap<String, Object>();
		
		articles.put("likeCnt", service.countLiArticle());
		articles.put("article", service.listSearch(cri));
		*/
		model.addAttribute("articles", service.listSearch(cri));
		model.addAttribute("pageCreator", pc);
		
		return "board/list";
	}


	//게시글 작성화면 열람요청
	@RequestMapping(value="/write", method=RequestMethod.GET)
	public String write(HttpSession session, Model model) {
		
		MemberVO member = (MemberVO) session.getAttribute("login");
		if(member != null) {
			model.addAttribute("trig", member.isTriggerAd());
		} 
		
		model.addAttribute("ID", member.getMemberId());

		logger.info("method: get > /board/write");
		return "board/write";
	}

	//게시글 등록 요청
	@PostMapping("/write")
	public String write(BoardVO article, RedirectAttributes redirectAttr) throws Exception {
		
		logger.info("method: post > /board/write");
		logger.info(article.toString());
		
		MultipartFile mfile = article.getFile();

		if(mfile != null && !mfile.isEmpty()) {
			
			logger.info("파일업로드");
			
			AddFileVO file = new AddFileVO();
			
			file.setFileName(mfile.getOriginalFilename());
			file.setFileSize(mfile.getSize());
			file.setFileData(mfile.getBytes());
			file.setFileContentType(mfile.getContentType());
			
			logger.info("file info: "+file);
			
			service.insert(article, file);
		} else {
			service.insert(article);
		}
	
		redirectAttr.addFlashAttribute("message", "regSuccess");
		return "redirect:/board/list";
	}


	
	//게시물 상세 조회 페이지 요청
	@RequestMapping(value="/content", method = RequestMethod.GET)
	public String content(@RequestParam("boardNo") int boardNo,			
			@ModelAttribute("criteria") SearchCriteria cri, HttpSession session,
			Model model) throws Exception {

		logger.info("method: get > /board/content");
		model.addAttribute("article", service.getArticle(boardNo, true));
		
		if(session.getAttribute("login") != null) {
			MemberVO member = (MemberVO) session.getAttribute("login");
			model.addAttribute("trig", member.isTriggerAd());
		} 
		
		if(fileservice.countFile(boardNo) != 0) {
			model.addAttribute("files", "확인용데이터");
		}
		
		model.addAttribute("like", likeservice.countLike(boardNo));
		
		//		model.addAttribute("page", page);

		return "board/content";
	}
	
	  @RequestMapping("/file/{boardNo}")
	   public ResponseEntity<byte[]> getFile(@PathVariable int boardNo, Model model) throws Exception {
	      
	      AddFileVO file = fileservice.selectFile(boardNo);
	      logger.info("file: " + file);
	      //파일을 클라이언트로 전송하기 위해 전송정보를 담을 헤더 설정
	      HttpHeaders headers = new HttpHeaders();
	      String[] ftypes = file.getFileContentType().split("/");
	      //전송 헤더에 파일정보와 확장자를 셋팅.
	      headers.setContentType(new MediaType(ftypes[0], ftypes[1]));
	      //전송 헤더에 파일 용량을 셋팅.
	      headers.setContentLength(file.getFileSize());
	      //전송 헤더에 파일명을 셋팅.
	      headers.setContentDispositionFormData("attachment", file.getFileName());
	      
	      model.addAttribute("fileNo", file.getFileNo());
	      
	      return new ResponseEntity<byte[]>(file.getFileData(), headers, HttpStatus.OK);
	   }
	   
	

	

	//게시물 수정 페이지 요청
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public String modify(@RequestParam("boardNo") int boardNo,
			@ModelAttribute("criteria") SearchCriteria cri, HttpSession session,
			Model model) throws Exception {
		
		if(session.getAttribute("login") != null) {
			MemberVO member = (MemberVO) session.getAttribute("login");
			model.addAttribute("trig", member.isTriggerAd());
		}

		logger.info("method: get > /board/modify");
		model.addAttribute("article", service.getArticle(boardNo, false));
		if(fileservice.countFile(boardNo) != 0) {
			model.addAttribute("file", fileservice.selectFile(boardNo));
		}
		
		return "board/modify";
	}

	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String modify(BoardVO article,
			SearchCriteria cri,
			RedirectAttributes redirectAttributes) throws Exception {

		logger.info("method: post > /board/modify");
		MultipartFile mfile = article.getFile();

		if(mfile != null && !mfile.isEmpty()) {
			
			logger.info("파일업로드");
			
			AddFileVO file = new AddFileVO();
			
			file.setFileName(mfile.getOriginalFilename());
			file.setFileSize(mfile.getSize());
			file.setFileData(mfile.getBytes());
			file.setFileContentType(mfile.getContentType());
			
			logger.info("file info: "+file);
			
			service.update(article, file);
		} else {
			service.update(article);
		}
		redirectAttributes.addAttribute("page", cri.getPage())
				.addAttribute("countPerPage", cri.getCountPerPage())
		.addAttribute("condition", cri.getCondition())
		.addAttribute("keyword", cri.getKeyword())
		.addFlashAttribute("message", "modSuccess");

		return "redirect:/board/list";
	}

	@RequestMapping(value="/delete", method = RequestMethod.POST)
	public String remove(@RequestParam("boardNo") int boardNo,
			SearchCriteria cri,
			RedirectAttributes redirectAttributes) throws Exception {

		logger.info("method: post > /board/delete");
		service.delete(boardNo);

		redirectAttributes.addAttribute("page", cri.getPage());
		redirectAttributes.addAttribute("countPerPage", cri.getCountPerPage())
		.addAttribute("condition", cri.getCondition())
		.addAttribute("keyword", cri.getKeyword());
		redirectAttributes.addFlashAttribute("message", "delSuccess");

		return "redirect:/board/list";
	}
	
	@RequestMapping(value="/reviewAd/{memberId}", method = RequestMethod.GET)
	public String reviewAd(@PathVariable String memberId, HttpSession session, Model model) throws Exception {
		
		SearchCriteria cri = new SearchCriteria();
		
		if(session.getAttribute("login") != null) {
			MemberVO member = (MemberVO) session.getAttribute("login");
			model.addAttribute("trig", member.isTriggerAd());
		}
		
		cri.setCondition("member_id");
		cri.setKeyword(memberId);
		
		model.addAttribute("articles", service.listSearch(cri))
			 .addAttribute("nickname", memberId);
		
		return "admin/review_admin";
	}
	
	//관리자 삭제
	@PostMapping("/deleteAd")
	@ResponseBody
	public String deleteAdmin(int boardNo, String memberId, RedirectAttributes redirect, Model model) throws Exception {
		
		service.delete(boardNo);
		
		String message = "delSuccess";
		redirect.addFlashAttribute("message", message);
		
		return message;
	}
	
	//내가쓴글 모아보기
//		@RequestMapping(value="/mywrite", method=RequestMethod.GET)
//		public ModelAndView myWrite(SearchCriteria cri, Model model) throws Exception {
//
//			logger.info("/mypage/mywrite 요청");
//
//			PageCreator pc = new PageCreator();
//			pc.setCriteria(cri);
//			pc.setArticleTotalCount(service.countMyArticle(cri));
//
//			model.addAttribute("mywrites", service.getMyArticle(cri));
//			model.addAttribute("pageCreator", pc);
//			
//			return new ModelAndView("mypage/mywrite");
//		}
//		
		@RequestMapping(value="/mylike", method=RequestMethod.GET)
		public ModelAndView LikeList(SearchCriteria cri, Model model,HttpSession session) throws Exception {
			
			if(session.getAttribute("login") != null) {
				MemberVO member = (MemberVO) session.getAttribute("login");
				model.addAttribute("trig", member.isTriggerAd());
			}
			
			logger.info("/mypage/mylike 요청");

			PageCreator pc = new PageCreator();
			pc.setCriteria(cri);
			//pc.setArticleTotalCount(service.countLiArticle(cri));

			model.addAttribute("mylikes", service.getLiArticle(cri));
			model.addAttribute("pageCreator", pc);
			
			
			return new ModelAndView("mypage/mylike");
			
			
		}

}
