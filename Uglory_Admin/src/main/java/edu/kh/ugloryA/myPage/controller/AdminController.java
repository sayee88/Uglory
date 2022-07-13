package edu.kh.ugloryA.myPage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.ugloryA.myPage.model.service.AdminService;

@Controller
@SessionAttributes({"loginAdmin"})
public class AdminController {

	@Autowired
	private AdminService service;
	
}
