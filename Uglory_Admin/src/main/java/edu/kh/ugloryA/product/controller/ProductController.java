package edu.kh.ugloryA.product.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;

import edu.kh.ugloryA.product.model.service.ProductService;
import edu.kh.ugloryA.product.model.vo.Product;

@Controller
@RequestMapping("/product")
@SessionAttributes({"product", "optionType", "farm"})
public class ProductController {
	
	@Autowired
	private ProductService service;
	
	//상품 조회 페이지
	@GetMapping("/list")
	public String productList() {
		return "adminProduct/adminProductList";
	}
	
	//상품 전체 조회
	@ResponseBody
	@GetMapping("/selectAll")
	public String selectAll() {
		
		List<Product> productList = service.selectAll();
		
		return new Gson().toJson(productList);
	}
	
	//상품 상세보기
	@GetMapping("/detail/{productCode}")
	public String productDetail(@PathVariable("productCode") int productCode,
								Model model) {
		
		Map<String, Object> detailMap = service.productDetail(productCode);
		model.addAttribute("detailMap", detailMap);
		
		return "adminProduct/adminPDetail";
	}
	
	//상품 품절 처리
	@ResponseBody
	@GetMapping("/soldout")
	public int soldout(int productCode) {
		return service.soldout(productCode);
	}
	
	//상품 입고 처리
	@ResponseBody
	@GetMapping("/stocked")
	public int stocked(int productCode) {
		return service.stocked(productCode);
	}
	
	
	//상품 등록 페이지 화면 전환
	@GetMapping("/register")
	public String productInsert(String mode,
								@RequestParam(value="productNo", required = false, defaultValue = "0") int productNo,
								Model model
			) {
		
		if(mode.equals("update")) {
			
		}
		
		
		
		return "adminProduct/adminProductIn";
	}
	
	//상품 설명 등록 화면 전환
	@GetMapping("/insert/info")
	public String productInfo() {
		return "adminProduct/adminProductInfo";
	}
	
	// insert페이지에서
	
	// 삽입일 경우
	// 데이터 session에 올리고 sunnernote페이지 호출
	
	// 수정일 경우
	// 원래 있던 정보 보여주기 + 업데이트 진행 후 detail 페이지 호출
	
	// summernote 페이지에서
	
	// 삽입일 경우
	// session에 있는 데이터까지 받아서 데이터 insert 진행
	
	// 수정일 경우
	// 데이터 update 진행
	
	// 삽입
	// - 데이터/ 이미지/ 농장 + summernote
	// 수정
	// - 데이터/ 이미지/ 농장
	// - summernote
	
	//삭제

	//구독 리스트 페이지
	@GetMapping("/subs/plist")
	public String subsPList() {
		return "adminProduct/adminPList";
	}
	
	//구독 리스트 등록 페이지
	@GetMapping("/subs/presister")
	public String subsPInsert() {
		return "adminProduct/adminPListIn";
	}
	
	//수정
	//삭제
	
}
