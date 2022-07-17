package edu.kh.ugloryA.payment.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.ugloryA.payment.model.service.PaymentService;
import edu.kh.ugloryA.payment.model.vo.Payment;
import edu.kh.ugloryA.payment.model.vo.PaymentDetail;

@Controller
@RequestMapping("/payment")
@SessionAttributes({"message"})
public class PaymentController {
	
	private Logger logger = LoggerFactory.getLogger(PaymentController.class);
	
	@Autowired
	private PaymentService service;
	
	@GetMapping("/selectAll")
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
	
	@ResponseBody
	@GetMapping("/checkOrder")
	public int checkOrder(String orderCode, Model model) {
		
		return service.checkOrder(orderCode);
	}
	
	
	
	@GetMapping("/PPaymentDetail")
	public String selectProductPaymentDetail(String orderCode, Model model) {
		
		PaymentDetail pPaymentDetail = service.selectProductPaymentDetail(orderCode);
		
		model.addAttribute("pPaymentDetail", pPaymentDetail);
		
		return "managePayment/ProductPaymentDetail";
	}
	
	
	@GetMapping("/SPaymentDetail")
	public String selectSubsPaymentDetail(String orderCode, Model model) {
		
		List<PaymentDetail> sPaymentDetailList = new ArrayList<PaymentDetail>();
				
		sPaymentDetailList = service.selectSubsPaymentDetail(orderCode);
		
		model.addAttribute("sPaymentDetailList", sPaymentDetailList);
		
		return "managePayment/SubsPaymentDetail";
	}
	

}
