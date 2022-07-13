package edu.kh.ugloryC.subscription.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import edu.kh.ugloryC.subscription.model.service.SubscriptionService;

@Controller
public class SubscriptionController {
	
	
	Logger logger = LoggerFactory.getLogger(SubscriptionController.class);
	
	@GetMapping("/subscription")
	public String Subscription(/*@PathVariable("categoryNo") int categoryNo,*/
							   Model model,
							   HttpServletRequest req,
							   HttpServletResponse resp) {
		
		
		
		return "subscription";
	}


}
