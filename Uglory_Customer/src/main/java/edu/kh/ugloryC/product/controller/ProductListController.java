package edu.kh.ugloryC.product.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import edu.kh.ugloryC.product.model.service.ProductService;
import edu.kh.ugloryC.product.model.vo.ProductDetail;

@Controller
public class ProductListController {
	
	@Autowired
	private ProductService service;
	
	Logger logger = LoggerFactory.getLogger(ProductListController.class);
	
	@GetMapping("/product/list")
	public String productList(@PathVariable("categoryNo") int categoryNo,
							  Model model,
							  HttpServletRequest req,
							  HttpServletResponse resp) {
		
		
		
		
		return "product/productList";
	}


}
