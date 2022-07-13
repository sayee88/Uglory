package edu.kh.ugloryA.customer.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;

import edu.kh.ugloryA.customer.model.service.CustomerService;
import edu.kh.ugloryA.customer.model.vo.Customer;

@Controller
@RequestMapping("/customer")
@SessionAttributes({"message"})
public class CustomerController {

	private Logger logger = LoggerFactory.getLogger(CustomerController.class);
	
	@Autowired
	private CustomerService service;
	
	
	@GetMapping("/selectAll")
	public String selectAll() {
		return "manageMember/MemberList";
	}
	
	
	// 고객 목록 조회 ajax
	@ResponseBody
	@GetMapping("/selectAllCustomer")
	public String selectAllCustomer() {
		List<Customer> list = service.selectAllCustomer();
		
		return new Gson().toJson(list);
	}
}
