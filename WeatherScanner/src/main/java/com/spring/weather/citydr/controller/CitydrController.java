package com.spring.weather.citydr.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.spring.weather.citydr.service.ICityDrService;

@RestController
@RequestMapping("/city")
public class CitydrController {

	@Autowired
	private ICityDrService service;
	
	
	@GetMapping("/resultwea")
	public ModelAndView resultWeather(@RequestParam("city") String city ,Model model) throws Exception {
		
		
		
		model.addAttribute("city", service.CityInfo(city))
			 .addAttribute("cityReviews", service.getCityReview(city));
		
		return new ModelAndView("result/result_weather");
		
	}
	
	
	public String deleteWeather(int cityNo) throws Exception {
		
		return "delSuccess";
	}
	
}
