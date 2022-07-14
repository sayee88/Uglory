package edu.kh.ugloryA.product.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.ugloryA.product.model.service.ProductService;

@Controller
@RequestMapping("/product")
@SessionAttributes({"loginMember", "product", "optionType", "farm"})
public class ProductController {
	
	@Autowired
	private ProductService service;

}
