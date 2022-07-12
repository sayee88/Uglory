package edu.kh.ugloryC.product.controller;

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

import edu.kh.ugloryC.product.model.service.ProductService;
import edu.kh.ugloryC.product.model.vo.ProductDetail;

@Controller
@RequestMapping("/product")
public class ProductController {
	
	@Autowired
	private ProductService service;
	
	Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@GetMapping("detail/{categoryNo}/{pCode}")
	public String productDetail(@PathVariable("categoryNo") int categoryNo,
							    @PathVariable("pCode") int pCode,
							    Model model,
							    HttpSession session,
							    HttpServletRequest req, HttpServletResponse resp) {
							
		ProductDetail detail = service.productDetail(pCode);
		
		// 별점 카운트, 리뷰 카운트, 총 상품금액 계산 필요

		model.addAttribute("detail", detail);
		
		return "product/productDetail";
	}			
}
