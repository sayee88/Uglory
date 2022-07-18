package edu.kh.ugloryC.subscription.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.ugloryC.member.model.vo.Member;
import edu.kh.ugloryC.subscription.model.service.SubscriptionService;

@SessionAttributes({"orderInfo", "deliveryInfo", "loginMember", "message"})
@Controller
public class SubscriptionController {
	
	@Autowired
	private SubscriptionService service;
	
	Logger logger = LoggerFactory.getLogger(SubscriptionController.class);
	
	// 구독 페이지1
	@GetMapping("/subscription")
	public String subscription(/*@ModelAttribute("loginMember") Member loginMember,*/
							   HttpSession session,
							   Model model,
							   RedirectAttributes ra,
							   HttpServletRequest req,
							   HttpServletResponse resp) {
		
		Member loginMember = (Member)session.getAttribute("loginMember");
		
		String path = "";
		
		
		if(loginMember == null) {
			ra.addFlashAttribute("message", "로그인 후 구독할 수 있습니다.");
			path = "member/login";
		}else {
			path = "subscription/subscription1";
		}
		
		
		return path;
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
		
		// 결제번호 생성
		LocalDate currentDate = LocalDate.now(); 
		String date = currentDate.format(DateTimeFormatter.ofPattern("yyMMdd"));
		int random = (int)(Math.random() * 5);
		String payNo = "SP" + date + "-" + random;
		
		orderInfo.put("payNo", payNo);
		
		// 주문번호(구독 상품 주문 코드) 생성
		String sOrderNo = service.createSOrderNo(orderInfo);
		orderInfo.put("sOrderNo", sOrderNo);
		orderInfo.put("sOrderNo", sOrderNo);
		
		model.addAttribute("orderInfo", orderInfo);
		
		
		// 첫 배송일 지정
		
		
		
		return "subscription/subscription2";
	}
	
	// 구독 페이지3
	
	@PostMapping("/subscription/pay")
	public String subscription_pay(@RequestParam(value="s-orderName") String inputName,
									@RequestParam(value="s-orderPhone") String inputPhone,
									@RequestParam(value="s-orderAddress") String[] inputAddress,
									@RequestParam(value="s-orderReq") String inputDelText,
									@ModelAttribute("orderInfo") Map<String, Object> orderInfo,
									@ModelAttribute("loginMember") Member loginMember,
									
									Model model,
									RedirectAttributes ra,
									HttpServletRequest req,
									HttpServletResponse resp) {
		
		String address = String.join(",,", inputAddress);
		
		int memberNo = loginMember.getMemberNo();
		
		if(inputDelText.equals("")) {
			inputDelText = "NULL";
		}
		
//		Map<String, Object> deliveryInfo = new HashMap<String, Object>();
		
		orderInfo.put("inputName", inputName);
		orderInfo.put("inputPhone", inputPhone);
		orderInfo.put("inputAddress", address);
		orderInfo.put("inputDelText", inputDelText);
		orderInfo.put("memberNo", memberNo);
		
		
		return "subscription/subscription3";
		
	}

}
	



