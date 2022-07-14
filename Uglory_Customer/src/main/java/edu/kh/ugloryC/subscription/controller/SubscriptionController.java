package edu.kh.ugloryC.subscription.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.ugloryC.subscription.model.service.SubscriptionService;

@SessionAttributes({"orderInfo", "deliveryInfo"})
@Controller
public class SubscriptionController {
	
	
	Logger logger = LoggerFactory.getLogger(SubscriptionController.class);
	
	// 구독 페이지1
	@GetMapping("/subscription")
	public String subscription(/*@PathVariable("categoryNo") int categoryNo,*/
							   Model model,
							   HttpServletRequest req,
							   HttpServletResponse resp) {
		
		
		
		return "subscription/subscription1";
	}
	
	// 구독 페이지2
	@GetMapping("/subscription/order")
	public String subscription_order(String box, String cycle, @RequestParam(value="choice", required = false) List<String> choice,
									Model model,
									HttpServletRequest req,
									HttpServletResponse resp) {
		
		Map<String, Object> orderInfo = new HashMap<String, Object>();
		
		orderInfo.put("box", box);
		orderInfo.put("cycle", cycle);
		orderInfo.put("choice", choice);
		
		model.addAttribute("orderInfo", orderInfo);
		
		
		return "subscription/subscription2";
	}
	
	// 구독 페이지3
	@PostMapping("/subscription/pay")
	public String subscription_pay(@RequestParam(value="s-orderName") String inputName,
									@RequestParam(value="s-orderPhone") String inputPhone,
									@RequestParam(value="s-orderAddress") String[] inputAddress,
									@RequestParam(value="s-orderReq") String inputDelText,
									Model model,
									HttpServletRequest req,
									HttpServletResponse resp) {
		
		String address = String.join(",,", inputAddress);
		
		Map<String, Object> deliveryInfo = new HashMap<String, Object>();
		
		deliveryInfo.put("inputName", inputName);
		deliveryInfo.put("inputPhone", inputPhone);
		deliveryInfo.put("inputAddress", address);
		deliveryInfo.put("inputDelText", inputDelText);
		
		model.addAttribute("deliveryInfo", deliveryInfo);
		
		
		
		return "subscription/subscription3";
	}
	
	


}
