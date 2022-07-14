package edu.kh.ugloryC.member.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import edu.kh.ugloryC.member.model.service.MemberService;
import edu.kh.ugloryC.member.model.vo.Member;
import edu.kh.ugloryC.member.model.vo.OrderHistory;

@Controller
@RequestMapping("/member")
@SessionAttributes({"loginMember"}) // 로그인 멤버 정보 얻어오는 어노테이션
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	//로그인
	@GetMapping("/login")
	public String login() {
		return "member/login";
	}
	//마이 페이지
	@GetMapping("/myPage")
	public String mypage() {
		return "member/myPage";
	}
	//회원 탈퇴
	@GetMapping("/secession")
	public String secession() {
		return "member/secession";
	}
	//내 구독 현황
	@GetMapping("/subscribeCHK")
	public String subscribeCHK() {
		return "member/subscribeCHK";
	}
	//개별 주문 내역 조회
	@GetMapping("/orderHistory")
	public String orderHistory() {
		return "member/orderHistory";
	}
	//구독 주문 내역 조회
	@GetMapping("/subscriptionHistory")
	public String subscriptionHistory() {
		return "member/subscriptionHistory";
	}
	
	
	//로그아웃 
	@GetMapping("/logout")
	public String logout(HttpSession session , SessionStatus status) {
		// 로그아웃 == 세션을 없애는것 
		
		//session.invalidate();  // 기존 세션 무효화 방식으로는 안된다!
		status.setComplete(); // 세션이 할일이 완료됨 -> 정보 없앤다 (로그아웃시킨다!!!!)
		
		
		return "redirect:/"; // 메인페이지로 리다이렉트
	}
	
	// 로그인
	@ResponseBody
	@PostMapping("/login")
	public int login(Member inputMember, Model model) {
		
		Member loginMember = service.login(inputMember);
		
		if(loginMember != null) {
			model.addAttribute("loginMember", loginMember);
			return 1;
		}
		
		return 0;
		
	}
	
	
	// 개별 상품 주문 조회
	@PostMapping
	public String orderHistory(int memberNo , Model model) {
		
		List<OrderHistory> orderHistory = service.orderHistory(memberNo);
		
		return null;
	}
}
