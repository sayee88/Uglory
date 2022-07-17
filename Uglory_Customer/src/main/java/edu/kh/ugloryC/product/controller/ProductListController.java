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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.ugloryC.product.model.service.ProductService;
import edu.kh.ugloryC.product.model.vo.ProductDetail;

@Controller
@SessionAttributes({""})
public class ProductListController {
	
	@Autowired
	private ProductService service;
	
	Logger logger = LoggerFactory.getLogger(ProductListController.class);
	
	@GetMapping("/product/list")
	public String productList(/*@PathVariable("categoryNo") int categoryNo,*/
							  Model model) {
		
		
		
		
		return "product/productList";
	}
	
	@GetMapping("/product/list/ca")
	public String categoryA(@RequestParam(value="ca") String ca) {

		
		
		return
	}


}
