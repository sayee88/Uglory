package edu.kh.ugloryC.main.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import edu.kh.ugloryC.main.model.service.MainService;
import edu.kh.ugloryC.main.model.vo.DeliveryProduct;

@Controller 
public class MainController {
	
	@Autowired
	private MainService service;

	@RequestMapping("/main")
	public String mainForward() {
		
		return "common/main";
	}
	
	// 미션 페이지로 이동
	@GetMapping("common/mission")
	public String mission() {
		return"common/mission";
	}
	
	// 이용 방법 페이지로 이동
	@GetMapping("common/about")
	public String about() {
		return"common/about";
	}
	
	// 개인정보처리방침 페이지로 이동
	@GetMapping("review/privacyPolicy")
	public String privacyPolicy() {
		return"review/privacyPolicy";
	}
	
	
	//메인페이지 배송 목록 불러오기
	@ResponseBody
	@GetMapping("/delivery/product")
	public String selectDeliveryProduct() {
		
		List<DeliveryProduct> thisWeekList = service.thisDeliveryProduct();
		List<DeliveryProduct> nextWeekList = service.nextDeliveryProduct();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("thisWeekList", thisWeekList);
		map.put("nextWeekList", nextWeekList);
		
		return new Gson().toJson(map);
	}
	
	
	
}
