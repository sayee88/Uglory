package edu.kh.ugloryA.farm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.kh.ugloryA.farm.model.service.FarmService;

@Controller
@RequestMapping("/farm")
public class FarmController {

	@Autowired
	private FarmService service;
	
	//농장 조회 페이지
	@GetMapping("/list")
	public String farmList() {
		
		return null;
	}
	
	//농장 등록 페이지
	@GetMapping("/insert")
	public String farmInsert() {
		
		return null;
	}
	
}
