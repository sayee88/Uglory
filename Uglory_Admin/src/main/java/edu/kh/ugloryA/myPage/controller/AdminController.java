package edu.kh.ugloryA.myPage.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	//로그인
	@PostMapping("/signIn")
	public String signIn( @ModelAttribute("inputAdmin") Admin inputAdmin,
						  Model model,
						  RedirectAttributes ra,
						  HttpServletRequest req,
						  HttpServletResponse resp,
						  @RequestParam(value="saveId", required=false) String saveId) {
		
		Admin loginAdmin = service.signIn(inputAdmin);
		
		String path = null;
		
		if(loginAdmin != null) {
			model.addAttribute("loginAdmin", loginAdmin);
			
			// 로그인 성공 시 무조건 쿠키 생성
			// 단, 아이디 저장 체크 여부에 따라서 쿠키의 유지 시간을 조정
			Cookie cookie = new Cookie("saveId", loginAdmin.getAdminEmail()); 
			
			if(saveId != null) {
				cookie.setMaxAge(60*60*24*30); // 초 단위로 지정(1달)
			} else {
				cookie.setMaxAge(0); // == 쿠키 삭제
			}
			
			// 쿠키가 적용될 범위(경로) 지정
			cookie.setPath( req.getContextPath() );
			
			// 쿠키를 응답 시 클라이언트에게 전달
			resp.addCookie(cookie);
			
			path = "redirect:/";
			
		} else {
			ra.addFlashAttribute("message", "아이디 또는 비밀번호가 일치하지 않습니다.");
			path = "redirect:/signIn";
		}
		
		return path;
	}
	
	
	//로그아웃
	@GetMapping("/logout")
	public String logout(SessionStatus status) {
		
		status.setComplete();
		
		return "redirect:/";
	}
	
	
	//관리자 가입 화면 전환
	@GetMapping("/signUp")
	public String signUp() {
		return "myPage/signup";
	}
	
	//이메일 중복 검사
	@ResponseBody
	@GetMapping("/emailDupCheck")
	public int emailDupCheck( @RequestParam("adminEmail") String adminEmail ) {
		
		int result = service.emailDupCheck(adminEmail);
		
		return result;
	}
	
	//관리자 가입
	@PostMapping("/signUp")
	public String signUp( @ModelAttribute("inputAdmin") Admin inputAdmin,
						  @RequestParam("uploadImage") MultipartFile uploadImage,
						  RedirectAttributes ra,
						  HttpServletRequest req) throws IOException {
		
		//프로필 이미지 담기
		
		//1) 경로 작성
		String webPath = "/resources/img/profileImage/";
		String folderPath = req.getSession().getServletContext().getRealPath(webPath);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("inputAdmin", inputAdmin);
		map.put("webPath", webPath);
		map.put("folderPath", folderPath);
		map.put("uploadImage", uploadImage);
		
		//회원가입 수행
		int result = service.signUp(map);
		
		String message = null;
		String path = null;
		
		if(result > 0) { //회원가입 성공
			message = "회원 가입 성공";			
			path = "redirect:/"; //메인페이지
			
		} else { //실패
			message = "회원 가입 실패";
			path = "redirect:/signUp"; //회원 가입 페이지
		}
		
		ra.addFlashAttribute("message", message);
		
		return path;
	}
	
}
