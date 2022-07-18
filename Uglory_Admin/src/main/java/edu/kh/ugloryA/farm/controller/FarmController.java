package edu.kh.ugloryA.farm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.ugloryA.farm.model.service.FarmService;
import edu.kh.ugloryA.farm.model.vo.Farm;

@Controller
@RequestMapping("/farm")
public class FarmController {

	@Autowired
	private FarmService service;
	
	//농장 조회 페이지
	@GetMapping("/list")
	public String farmList(Model model) {
		
		List<Farm> farmList = service.selectFarmList();
		
		model.addAttribute("farmList", farmList);
		
		return "adminFarm/adminFarmList";
	}
	
	@ResponseBody
	@GetMapping("/delete")
	public int deleteFarm(int farmNo) {
		
		int result = 0;
		
		int count = service.countFarm(farmNo);
		
		if(count == 0) {
			result = service.deleteFarm(farmNo);
		}
		
		return result;
	}
	
	//농장 등록 페이지
	@GetMapping("/insert")
	public String farmInsert() {
		return "adminFarm/adminFarmIn";
	}
	
	//농장명 중복 검사
	@ResponseBody
	@GetMapping("/farmNameDupCheck")
	public int farmNameDupCheck(String farmName) {
		return service.farmNameDupCheck(farmName);
	}
	
	//농장 등록 페이지
	@PostMapping("/insert")
	public String insertFarm(Farm farm,
							 RedirectAttributes ra,
							 HttpServletRequest req) {
		
		String path = null;
		String message = null;
		
		int result = service.insertFarm(farm);
		
		if(result > 0) {
			path = "list";
			message = "농장 등록을 성공하였습니다.";
		} else {
			path = req.getHeader("referer");
			message = "농장 등록을 실패하였습니다.";
		}
		
		ra.addFlashAttribute("message", message);
		return "redirect:" + path;
	}
	
}
