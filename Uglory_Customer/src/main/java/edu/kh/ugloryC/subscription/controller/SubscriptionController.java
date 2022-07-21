package edu.kh.ugloryC.subscription.controller;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
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
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.ugloryC.member.model.vo.Member;
import edu.kh.ugloryC.subscription.model.service.SubscriptionService;
import edu.kh.ugloryC.subscription.model.vo.OrderInfo;

@SessionAttributes({"orderInfo", "deliveryInfo", "loginMember","choice"})
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
			path = "redirect: member/login";
			session.setAttribute("message", "로그인 후 이용해주세요");
		}else {
			int memberNo = loginMember.getMemberNo();
			
			String result = service.checkSubs(memberNo);
			if(result != null) { // 구독 중
				path = "redirect: member/subscriptionStatus";
				session.setAttribute("message", "구독 중인 상품이 있습니다. 확인해주세요.");

			}
			if(result == null) {
				path = "subscription/subscription1";
				
			}
			
		}
		
		
		return path;
	}
	
	// 구독 페이지2
	@GetMapping("/subscription/order")
	public String subscription_order(String box, String cycle, @RequestParam(value="choice", required = false) List<String> choice,
									Model model,
									HttpSession session,
									HttpServletRequest req,
									HttpServletResponse resp) {
		
//		Map<String, Object> orderInfo = new HashMap<String, Object>();
		
		OrderInfo orderInfo = new OrderInfo();
		
		orderInfo.setBox(box);
		orderInfo.setCycle(cycle);
//		orderInfo.setChoice(choice); -> list는 set 못함 -> 따로 모델로 담음
		
//		orderInfo.put("box", box);
//		orderInfo.put("cycle", cycle);
//		orderInfo.put("choice", choice);
		
		// 결제번호 생성
//		LocalDate currentDate = LocalDate.now(); 
//		String date = currentDate.format(DateTimeFormatter.ofPattern("yyMMdd"));
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
		String date = sdf.format(new Date());
		int random = (int)(Math.random() * 5);
		String payNo = "SP" + date + "-" + random;
		
		orderInfo.setPayNo(payNo);
//		orderInfo.put("payNo", payNo);
		
		// 주문번호(구독 상품 주문 코드) 생성
		String subsOrderNo = service.createSOrderNo(orderInfo);
		orderInfo.setSubsOrderNo(subsOrderNo);
//		orderInfo.put("sOrderNo", sOrderNo);
		
		// 첫배송일 지정
		Date firstDelDate = service.setFirstDelDate();
		
		session.setAttribute("orderInfo", orderInfo);
		
		if(choice != null) {
			session.setAttribute("choice", choice);
		}
		session.setAttribute("firstDelDate", firstDelDate);

		
		
		
		return "subscription/subscription2";
	}
	
	// 구독 페이지3
	
	@PostMapping("/subscription/pay")
	public String subscription_pay(@RequestParam(value="s-orderName") String inputName,
									@RequestParam(value="s-orderPhone") String inputPhone,
									@RequestParam(value="s-orderAddress") String[] inputAddress,
									@RequestParam(value="s-orderReq") String inputDelText,
									@ModelAttribute("orderInfo") OrderInfo orderInfo,
									@ModelAttribute("loginMember") Member loginMember,
									@ModelAttribute("firstDelDate") Date firstDelDate,
									HttpSession session,
									Model model,
									RedirectAttributes ra,
									HttpServletRequest req,
									HttpServletResponse resp) {
		
		String address = String.join(",,", inputAddress);
		
		int memberNo = loginMember.getMemberNo();
		
		if(inputDelText.equals("")) {
			inputDelText = " ";
		}		
		
		
		orderInfo.setInputName(inputName);
		orderInfo.setInputPhone(inputPhone);
		orderInfo.setAddress(address);
		orderInfo.setInputDelText(inputDelText);
		orderInfo.setMemberNo(memberNo);
		orderInfo.setFirstDelDate(firstDelDate);
		
//		model.addAttribute(orderInfo);
		
		session.setAttribute("orderInfo", orderInfo);
				
		return "subscription/subscription3";
		
	}

}
	



