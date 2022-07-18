package edu.kh.ugloryC.product.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;

import edu.kh.ugloryC.product.model.service.ProductListService;
import edu.kh.ugloryC.product.model.vo.ProductDetail;
import edu.kh.ugloryC.product.model.vo.ProductList;

@Controller
public class ProductListController {
	
	@Autowired
	private ProductListService service;
	
	Logger logger = LoggerFactory.getLogger(ProductListController.class);
	
	@GetMapping("/product/list")
	public String productList(Model model) {
		
		List<ProductList> pList = new ArrayList<ProductList>();
		pList = service.productList();
		
		model.addAttribute("pList", pList);
		
		return "product/productList";
	}
	
	
	// 리스트 조회 AJAX
	@ResponseBody
	@GetMapping("/product/list/all")
	public String productListAll() {
		List<ProductList> pList = new ArrayList<ProductList>();
		pList = service.productList();
				
		return new Gson().toJson(pList);
	}
	
	@ResponseBody
	@GetMapping("/product/list/category")
	public String category(@RequestParam(value="selectCategoryNo") int selectCategoryNo,
						   Model model) {
		
		List<ProductList> pcList = new ArrayList<ProductList>();
		
		pcList = service.category(selectCategoryNo);
		
		model.addAttribute(pcList);
		
		return new Gson().toJson(pcList);
	}
	


}