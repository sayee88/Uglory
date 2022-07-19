package edu.kh.ugloryC.subscription.controller;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.swing.text.DateFormatter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.ugloryC.member.model.vo.Member;
import edu.kh.ugloryC.subscription.model.service.SubscriptionService;
import edu.kh.ugloryC.subscription.model.vo.OrderInfo;
import edu.kh.ugloryC.subscription.model.vo.Subscription;

@SessionAttributes({"orderInfo", "loginMember", "message", "choice", "firstDelDate"})
@Controller
public class SubscriptionPay {
	
	@Autowired
	private SubscriptionService service;
	
	
	// 구독 결제
	@ResponseBody
	@PostMapping("/subscription/kakaopay")
	public int subscriptionPay(@RequestParam String subsOrderNo,
								  @RequestParam String orderName,
								  @RequestParam int orderPhone,
								  @RequestParam String orderAddress,
								  @RequestParam(value="delText", required=false) String delText,
								  @RequestParam int cycle,
								  @RequestParam int memberNo,
								  @RequestParam int box,
								  @RequestParam int amount,
								  @RequestParam String payNo,
								  @ModelAttribute("loginMember") Member loginMember,
								  @ModelAttribute("orderInfo") OrderInfo orderInfo,
								  @ModelAttribute("choice") List<String> choice,
								  @ModelAttribute("firstDelDate") Date firstDelDate,
								  Model model,
								  RedirectAttributes ra) {
		
		
		Map<String, Object> payInfo = new HashMap<String, Object>();
		
//		List<String> choice = orderInfo.getChoice();		

//		payInfo.put("firstDelDate", firstDelDate);
		payInfo.put("subsOrderNo", subsOrderNo);
		payInfo.put("orderName", orderName);
		payInfo.put("orderPhone", orderPhone);
		payInfo.put("orderAddress", orderAddress);
		payInfo.put("delText", delText);
		payInfo.put("cycle", cycle);
		payInfo.put("choice", choice);
		payInfo.put("memberNo", memberNo);
		payInfo.put("box", box);
		payInfo.put("amount", amount);
		payInfo.put("payNo", payNo);
		payInfo.put("choice", choice);
		
		// 주문 삽입
		int result = service.insertSubsOrder(payInfo);
				
		return result;
				
	}
	

}
