package edu.kh.ugloryA.review.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.ugloryA.review.model.service.ReviewService;
import edu.kh.ugloryA.review.model.vo.Review;

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
			Model model) {
		
		List<Review> reviewList = new ArrayList<Review>();
		
		if(key == null && query == null) {
			reviewList = service.selectAllReview();
		} else {
			reviewList = service.searchReview(key, query);
		}
		
		model.addAttribute("reviewList", reviewList);
		
		return "manageReview/ReviewList";
	}

}
