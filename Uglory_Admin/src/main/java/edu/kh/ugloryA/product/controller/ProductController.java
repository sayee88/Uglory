package edu.kh.ugloryA.product.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.ugloryA.product.model.service.ProductService;

@Controller
@RequestMapping("/product")
@SessionAttributes({"loginMember", "product", "optionType", "farm"})
public class ProductController {
	
	@Autowired
	private ProductService service;
	
	//상품 조회 페이지
	@GetMapping("/list")
	public String productList() {
		
		return null;
	}
	
	//상품 상세보기
	@GetMapping("/detail/{productCode}")
	public String productDetail() {
		
		return null;
	}
	
	//상품 등록 페이지 화면 전환
	@GetMapping("/insert")
	public String productInsert() {
		
		return null;
	}
	

	//구독 리스트 페이지
	@GetMapping("/subs/plist")
	public String subsPList() {
		
		return null;
	}
	
	//구독 리스트 등록 페이지
	@GetMapping("/subs/pinsert")
	public String subsPInsert() {
		
		return null;
	}
	
	
}
