package edu.kh.ugloryA.myPage.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.ugloryA.myPage.model.service.AdminService;
import edu.kh.ugloryA.myPage.model.vo.Admin;

@Controller
@SessionAttributes({"loginAdmin"})
public class AdminController {

	@Autowired
	private AdminService service;
	
	//로그인 화면 전환
	@GetMapping("/signIn")
	public String signIn() {
		return "myPage/signin";
	}
	
	//로그아웃
	@GetMapping("/logout")
	public String logout(SessionStatus status) {
		
		status.setComplete();
		
		return "redirect:/";
	}
	
	
	//회원가입 화면 전환
	@GetMapping("/signUp")
	public String signUp() {
		return "myPage/signup";
	}
	
	//이메일 중복 검사
	@ResponseBody
	@GetMapping("/emailDupCheck")
	public int emailDupCheck( @RequestParam("adminEmail") String adminEmail ) {
		
//		int result = service.emailDupCheck(memberEmail);
		
		return 0;
	}
	
	//회원가입
	@PostMapping("/signUp")
	public String signUp( @RequestParam Map<String, Object> map,
						  RedirectAttributes ra,
						  HttpServletRequest req) throws IOException {
		
		//프로필 이미지 담기
		
		//1) 경로 작성
		String webPath = "/resources/img/profileImage/";
		String folderPath = req.getSession().getServletContext().getRealPath(webPath);
		
		map.put("webPath", webPath);
		map.put("folderPath", folderPath);
		
		//회원가입 수행
		int result = service.signUp(map);
		
		String message = null;
		String path = null;
		
		if(result > 0) { //회원가입 성공
			message = "회원 가입 성공";			
			path = "redirect:/"; //메인페이지
			
		} else { //실패
			message = "회원 가입 실패";
			path = "redirect:/member/signUp"; //회원 가입 페이지
		}
		
		ra.addFlashAttribute("message", message);
		
		return path;
	}
	
}
