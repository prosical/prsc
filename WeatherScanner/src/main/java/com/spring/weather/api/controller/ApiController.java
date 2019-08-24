package com.spring.weather.api.controller;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.weather.api.model.ApiVO;
import com.spring.weather.api.service.IApiService;
import com.spring.weather.citydr.model.CityDrVO;
import com.spring.weather.citydr.service.ICityDrService;


@Controller
public class ApiController {
	
	
	@Autowired
	private IApiService apiService;
	@Autowired
	ICityDrService drservice;
	
	private static final Logger logger = LoggerFactory.getLogger(ApiController.class);
		
	@GetMapping("/main")
	public String mainPage() {
		return "/kdh/main-test";
	}
	
	@GetMapping("/api")
	public String paramTest(Model model,
			@RequestParam("date") String date,
			@RequestParam("city") String city) throws Exception {
		
		Date d = new Date();
		int h = d.getHours();
		int min = d.getMinutes();
		int s = d.getSeconds();
		
		String hours = (h < 10) ? "0"+h : h+"";
		String minutes = (min < 10) ? "0"+min : min+"";
		String seconds = (s < 10) ? "0"+s : s+"";
		
		String cityName=city;
		CityDrVO dr = drservice.CityInfo(cityName);
		model.addAttribute("info", dr.getCityInfo().replace("\n","<br>"));
		model.addAttribute("dr", dr);
		
		
		String time = date+"T"+hours+":"+minutes+":"+seconds;
		
		ApiVO a = apiService.getLatLon(city);
		model.addAttribute("city", city);
		model.addAttribute("lat",(a.getLat()));
		model.addAttribute("lon",(a.getLon()));
		model.addAttribute("time", time);
		model.addAttribute("date", date);
		
		return "/result/result_weather";
	}
	
	@GetMapping("/instar")
	public String iconTest() {
		return "/kdh/instargram";
	}
	
	
	
	
}
