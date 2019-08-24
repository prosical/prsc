package com.spring.weather.login.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.weather.login.service.KakaoService;


@Controller
public class KakaoController {

	@Autowired
	private KakaoService kakaoService;
	
	@GetMapping("/loginTest")
	public String loginTest() {
		
		
		
		
		return "kakao";
	}
	
	//카카오 로그인인증처리 메서드
	@GetMapping("/kakaoLogin")
	public String kakaoLogin(@RequestParam String code,HttpSession session) throws Exception{
		//System.out.println("auth-code: "+code);
		String accessToken = kakaoService.getAccessToken(code);
		//사용자 정보 얻기 
		Map<String, Object> userData = kakaoService.getKakaoUserData(accessToken);
		
		//사용자 정보세션에 저장
		session.setAttribute("access_token", accessToken);
		session.setAttribute("login", userData);
		return "redirect:/main";
	}
	
	//로그아웃처리
	@GetMapping("/kakaoLogout")
	public String logout(HttpSession session) {
		kakaoService.kakaoLogout((String)session.getAttribute("access_token"));
		session.invalidate();
		return "redirect:/main";
	}
	
}
