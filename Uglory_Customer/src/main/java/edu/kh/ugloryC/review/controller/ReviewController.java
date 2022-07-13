package edu.kh.ugloryC.review.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/review")
public class ReviewController {

	
	// 이용 약관
	@GetMapping("/termsAndCondition")
	public String termsAndCondition() {
		return "review/termsAndCondition";
	}
	
	
	// 이용후기
	@GetMapping("/list")
	public String review(){
		
		return "review/Review";
	}
	
	
	// 리뷰 작성 화면 전환
	@GetMapping("/write")
	public String write() {
		
		return "review/ReviewWriteForm";
	}
	
	// 리뷰 작성
	@PostMapping("/write/{reviewCode}")
	public String write(HttpServletRequest req, RedirectAttributes ra
						, @PathVariable("reviewCode") int reviewCode) {
		
		return "";
	}
	
}
