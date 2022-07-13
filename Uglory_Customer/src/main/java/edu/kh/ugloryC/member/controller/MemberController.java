package edu.kh.ugloryC.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.ugloryC.member.model.service.MemberService;

@Controller
@RequestMapping("/member")
@SessionAttributes({"loginMember"}) // 로그인 멤버 정보 얻어오는 어노테이션
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	//
	@GetMapping("/login")
	public String login() {
		return "member/login";
	}
	
	
}
