package edu.kh.ugloryC.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;

import edu.kh.ugloryC.member.model.service.MemberService;
import edu.kh.ugloryC.member.model.vo.Member;
import edu.kh.ugloryC.member.model.vo.OrderHistory;
import edu.kh.ugloryC.member.model.vo.SubHistory;
import edu.kh.ugloryC.member.model.vo.SubscriptionStatus;

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
	
	// 개별 주문 목록 내역 조회
	@GetMapping("/orderHistory")
	public String orderHistory(Model model, @ModelAttribute("loginMember") Member loginMember) {
		List<OrderHistory> orderHistoryList = service.selectOrderHistoryList(loginMember.getMemberNo());

		model.addAttribute("orderHistoryList", orderHistoryList);
		
		return "member/orderHistory";
	}
	
	// 개별 주문 상세 조회 조회
	@ResponseBody
	@GetMapping("/OrderHistoryDetail")
	public String selectOrderHistoryDetail(String orderNo) {
		
		return new Gson().toJson(service.selectOrderHistoryDetail(orderNo));
		
	}
	
	
	//구독 주문 목록 내역 조회
	@GetMapping("/subscriptionHistory")
	public String subscriptionHistory(Model model , @ModelAttribute("loginMember")Member loginMember) {
		
		List<SubHistory> subHistoryList = service.selectSubHistoryList(loginMember.getMemberNo());
		
		model.addAttribute("subHistoryList",subHistoryList);
		
		return "member/subscriptionHistory";
	}
		
	
	// 구독 주문 상세 조회
	@ResponseBody
	@GetMapping("/SubHistoryDetail")
	public String selectSubHistoryDetail(String subOrderNo) {
		
		return new Gson().toJson(service.selectSubHistoryDetail(subOrderNo));
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
	
			// 탈퇴 상태이면서 하루가 안 지난 경우
			if(loginMember.getSecessionFlag().equals("Y") && loginMember.getPassStatus() < 1) {
				return -2;
			}
			
			// 탈퇴 상태이면서 하루가 지난 경우
			else if(loginMember.getSecessionFlag().equals("Y") && loginMember.getPassStatus() > 0) {
				return -1;
			}
			
			
			model.addAttribute("loginMember", loginMember);
			return 1;
		}
		
		return 0;
		
	}
	
	// 회원 탈퇴
	@PostMapping("/secession") // 회원정보에 다들어있으니깐 
	public String secession(@ModelAttribute("loginMember") Member loginMember
						    ,@RequestParam("choice") int choice
			                ,SessionStatus status// 세션 없애기
							,RedirectAttributes ra // 메세지 출력
							)  {
		Map<String , Object> map = new HashMap<String, Object>();
		
		map.put("memberNo", loginMember.getMemberNo());
		map.put("choise", choice);
		
		
		int result = service.secession(map);
		
		String message = null;
		String path = null;
		
		if(result >0) {
			message = "탈퇴 되었습니다.";
			path = "/";
			
			// ㅅㅔ션 없애기
			status.setComplete();
			
		}else {
			
			message = "탈퇴 실패";
			path = "secession";
		}
		ra.addFlashAttribute("message", message);
		
		return "redirect:"+path;
	}
	
	// 24시간 경과 후 재가입
	@ResponseBody
	@PostMapping("/reSignUp")
	public int reSignUp(Member inputMember, Model model) {
		Member loginMember = service.reSignUp(inputMember.getMemberEmail());
		
		if(loginMember != null) {
			model.addAttribute("loginMember", loginMember);
			return 1;
		}
		
		return 0;
	}
	
	
	// 내 구독 현황
	@GetMapping("/subscriptionStatus")
	public String SubscriptionStatus(@ModelAttribute("loginMember") Member loginMember, Model model
										,SubscriptionStatus sub
										,RedirectAttributes ra) {
		
		int memberNo = loginMember.getMemberNo();
		
		SubscriptionStatus substatus = service.subscriptionStatus(memberNo);
		
		if(substatus == null) {
			int subCount = 0;
			model.addAttribute("subCount", subCount);
			
		} else {
			
			int subCount = 1;
			model.addAttribute("subCount", subCount);

		}
		
		model.addAttribute("substatus", substatus);

		return "member/subscriptionStatus";
	}
	
	// 내구독 상품 취소
	@PostMapping("/subscriptionStatus")
	public String subcancel(@ModelAttribute("loginMember") Member loginMember,
							RedirectAttributes ra, Model model) {
		
		int memberNo = loginMember.getMemberNo();
		
		int result = service.subCancel(memberNo);
		
		String message = null;
		String path = null;

		if(result > 0) {
			
			message = "구독 상품이 취소되었습니다.";
			path = "subscriptionStatus";
			
			ra.addFlashAttribute("message", message);
			
			return "redirect:" + path;
			
		} else {
			
			message = "구독 상품 취소 실패! 다시 시도해주세요.";
			path = "subscriptionStatus";
			
			ra.addFlashAttribute("message", message);
			return "redirect:" + path;
		}
	}
	

}
