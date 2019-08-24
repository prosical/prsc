package com.spring.weather.location.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.spring.weather.board.service.IBoardService;
import com.spring.weather.commons.paging.SearchCriteria;
import com.spring.weather.location.model.LocationVO;
import com.spring.weather.location.service.ILocationService;
import com.spring.weather.member.model.MemberVO;

@RestController
@RequestMapping("/reLoca")
public class LocationController {

	@Autowired
	private ILocationService service;

	@Autowired
	IBoardService boardservice;

	@GetMapping("/recity")
	public ModelAndView listLocation(Model model,@RequestParam("month") int month) throws Exception {

		model.addAttribute("locations", service.MonthLocation(month));
		model.addAttribute("month", month);
		return new ModelAndView("result/result_city");
	}

	//관리자 페이지 데이터 호출
	@GetMapping("/admincity")
	public ModelAndView adminLocation(HttpSession session ,SearchCriteria cri,Model model) throws Exception {

		if(session.getAttribute("login") != null) {
			MemberVO member = (MemberVO) session.getAttribute("login");
			model.addAttribute("trig", member.isTriggerAd());
		}

		
		model.addAttribute("locations", service.adminLoca());

		return new ModelAndView("admin/reloca_admin");

	}

	@DeleteMapping("/delcity")
	public String deleteLocation(
						int cityNo) throws Exception {

		service.deleteLocation(cityNo);

		//attribute.addAttribute("page", cri.getPage());
				 //.addFlashAttribute("message","delSeccess");	
		
		return "delSuccess";
	}
	
	@GetMapping("/content/{cityNo}")
	public ModelAndView cityInfomation(@PathVariable int cityNo, HttpSession session, Model model) throws Exception {
			
		model.addAttribute("location", service.getDetailCity(cityNo));	
		

		if(session.getAttribute("login") != null) {
			MemberVO member = (MemberVO) session.getAttribute("login");
			model.addAttribute("trig", member.isTriggerAd());
		}
			
		return new ModelAndView("result/cityInfo");
	}
	
	@GetMapping("/modify/{cityNo}")
	public ModelAndView cityInfoModify(@PathVariable int cityNo, HttpSession session, SearchCriteria cri ,Model model) throws Exception {
		

		if(session.getAttribute("login") != null) {
			MemberVO member = (MemberVO) session.getAttribute("login");
			model.addAttribute("trig", member.isTriggerAd());
		}
		
		model.addAttribute("article", service.getDetailCity(cityNo))
			 .addAttribute("cri", cri);
		return new ModelAndView("admin/modify");
	}
	
	@PostMapping("/modifycity")
	public ModelAndView cityModify(LocationVO article,Model model) throws Exception {
		
		service.updateLocation(article);
		
		return new ModelAndView("redirect:/reLoca/admincity");
	}
	
	@GetMapping("/writeCity")
	public ModelAndView cityInsertInfo(HttpSession session, Model model) throws Exception {

		if(session.getAttribute("login") != null) {
			MemberVO member = (MemberVO) session.getAttribute("login");
			model.addAttribute("trig", member.isTriggerAd());
		}
		
		return new ModelAndView("admin/writeInfo");
	}
	
	@PostMapping("/insert")
	public ModelAndView cityInsert(LocationVO city, Model model) throws Exception {
		
		service.insertLocation(city);
		
		return new ModelAndView("redirect:/reLoca/admincity");
	}
}
