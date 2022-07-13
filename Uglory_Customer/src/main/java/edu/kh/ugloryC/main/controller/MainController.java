package edu.kh.ugloryC.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller 
public class MainController {

	@RequestMapping("/main")
	public String mainForward() {
		
		return "common/main";
	}
	
	// 미션 페이지로 이동
	@GetMapping("common/mission")
	public String mission() {
		return"common/mission";
	}
	
	// 이용 방법 페이지로 이동
	@GetMapping("common/about")
	public String about() {
		return"common/about";
	}
	
	// 개인정보처리방침 페이지로 이동
	@GetMapping("review/privacyPolicy")
	public String privacyPolicy() {
		return"review/privacyPolicy";
	}
	
}
