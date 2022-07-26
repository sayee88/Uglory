package edu.kh.ugloryA.review.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;

import edu.kh.ugloryA.review.model.service.ReviewService;
import edu.kh.ugloryA.review.model.vo.Review;
import edu.kh.ugloryA.review.model.vo.ReviewDetail;

@Controller
@RequestMapping("/review")
@SessionAttributes({"message"})
public class ReviewController {
	
	private Logger logger = LoggerFactory.getLogger(ReviewController.class);
	
	@Autowired
	private ReviewService service;
	
	@GetMapping("/selectAll")
	public String selectAll(@RequestParam(value="key", required = false) String key,
			@RequestParam(value="query", required = false) String query,
			@RequestParam(value="cp", required = false, defaultValue = "1") int cp,
			Model model) {
		
		Map<String, Object> map = null;
		
		
		if(key == null && query == null) {
			map = service.selectAllReview(cp);
		} else {
			map = service.searchReview(cp, key, query);
		}
		
		
		model.addAttribute("map", map);
		
		return "manageReview/ReviewList";
	}
	
	
//	@GetMapping("/reviewDetail/{reviewNo}")
//	public String selectReviewDetail(@PathVariable("reviewNo") int reviewNo, Model model) {
//		
//		ReviewDetail reviewDetail = service.selectReviewDetail(reviewNo);
//		
//		model.addAttribute("reviewDetail", reviewDetail);
//		
//		return "manageReview/ReviewList";
//	}
	
	@ResponseBody
	@GetMapping("/reviewDetail")
	public String selectReviewDetail(int reviewNo) {
		
		ReviewDetail reviewDetail = service.selectReviewDetail(reviewNo);
		
		return new Gson().toJson(reviewDetail);
	}
	
	
	@ResponseBody
	@GetMapping("/deleteReview")
	public int deleteReview(int reviewNo) {
		
		int result = service.deleteReview(reviewNo);
		
		return result; 
	}
	
	
	
	
	
	
	

}
