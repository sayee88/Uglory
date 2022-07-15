package edu.kh.ugloryA.payment.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.ugloryA.payment.model.service.PaymentService;
import edu.kh.ugloryA.payment.model.vo.Payment;

@Controller
@RequestMapping("/selectPayment")
@SessionAttributes({"message"})
public class PaymentController {
	
	private Logger logger = LoggerFactory.getLogger(PaymentController.class);
	
	@Autowired
	private PaymentService service;
	
	@GetMapping("/selectAllPayment")
	public String selectAll(@RequestParam(value="key", required = false) String key,
			@RequestParam(value="query", required = false) String query,
			Model model) {
		
		List<Payment> paymentList = new ArrayList<Payment>();
		
		if(key == null && query == null) {
			paymentList = service.selectAllPayment();
		} else {
			paymentList = service.searchPayment(key, query);
		}
		
		model.addAttribute("paymentList", paymentList);
		
		return "managePayment/PaymentList";
	}

}
