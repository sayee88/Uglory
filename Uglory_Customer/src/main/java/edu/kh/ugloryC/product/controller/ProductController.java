package edu.kh.ugloryC.product.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import edu.kh.ugloryC.product.model.service.OptionService;
import edu.kh.ugloryC.product.model.service.ProductService;
import edu.kh.ugloryC.product.model.vo.OptionType;
import edu.kh.ugloryC.product.model.vo.ProductDetail;


@Controller
@RequestMapping("/product")
public class ProductController {
	
	@Autowired
	private ProductService service;
	
	@Autowired
	private OptionService optionService;
	
	Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	// 상품 상세 조회
	@GetMapping("detail/{categoryNo}/{pCode}")
	public String productDetail(@PathVariable("categoryNo") int categoryNo,
							    @PathVariable("productCode") int productCode,
							    int optionCode,
							    int deliveryAmount,
							    Model model,
							    @RequestParam Map<String, Object> paramMap,
							    HttpServletRequest req, HttpServletResponse resp) {
							
		ProductDetail detail = service.productDetail(productCode);
	
		// 상품에 따른 옵션 조회
		if(detail != null) { // 상세 조회 성공 시
			
			List<OptionType> optionList = optionService.selectOptionList(productCode);
			
			model.addAttribute("optionList", optionList);
			
			if(!optionList.isEmpty()) { // 옵션 조회 성공 시
				
				paramMap.put("productCode", productCode);
				paramMap.put("optionCode", optionCode);
				
				int result = service.totalAmount(paramMap);
				
				model.addAttribute("result", result);
			}
		}
		
		// 별점 카운트, 리뷰 카운트, 총 상품금액 계산 필요
		
		model.addAttribute("detail", detail);
		
		return "product/productDetail";
	}			
}
