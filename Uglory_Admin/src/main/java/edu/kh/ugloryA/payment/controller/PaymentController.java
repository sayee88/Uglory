package edu.kh.ugloryA.payment.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import edu.kh.ugloryA.payment.model.vo.ProductPaymentDetail;
import edu.kh.ugloryA.payment.model.vo.Refund;
import edu.kh.ugloryA.payment.model.vo.SubsPaymentDetail;

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
			@RequestParam(value="cp", required= false, defaultValue = "1") int cp,
			Model model) {
		
		
		Map<String, Object> map = null;
		
		if(key == null && query == null) {
			
			map = service.selectAllPayment(cp);
		} else {
			
			map = service.searchPayment(cp, key, query);
		}
		
		model.addAttribute("map", map);
		
		return "managePayment/PaymentList";
	}
	
	
	@GetMapping("/PPaymentDetail/{payNo}")
	public String selectProductPaymentDetail(@PathVariable("payNo") String payNo, Model model) {
		
		ProductPaymentDetail pPaymentDetail = (ProductPaymentDetail)service.selectProductPaymentDetail(payNo);
		
		model.addAttribute("pPaymentDetail", pPaymentDetail);
		
		return "managePayment/ProductPaymentDetail";
	}
	
	
	@GetMapping("/SPaymentDetail/{payNo}")
	public String selectSubsPaymentDetail(@PathVariable("payNo") String payNo, Model model) {
		
		
		SubsPaymentDetail sPaymentDetail = (SubsPaymentDetail)service.selectSubsPaymentDetail(payNo);
		
		model.addAttribute("sPaymentDetail", sPaymentDetail);
		
		return "managePayment/SubsPaymentDetail";
	}
	
	@GetMapping("/refundList")
	public String selectRefundList(Model model) {
		
		int prodPaymentCount = service.prodPaymentCount();
		
		int refundCount = service.refundCount();
		
		int refundDone = service.refundDone();
		
		int subsCount = service.subsCount();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("prodPaymentCount", prodPaymentCount);
		map.put("refundCount", refundCount);
		map.put("refundDone", refundDone);
		map.put("subsCount", subsCount);
		
		List<Refund> refundList = service.selectRefundList();
		
		map.put("refundList", refundList);
		
		model.addAttribute("map", map);
		
		return "managePayment/SalesList";
	}
	
	
	@GetMapping("/refund")
	@ResponseBody
	public int refundHandling(String orderCode) {
		return service.refundHandling(orderCode);
	}
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//	
//	
//	@ResponseBody
//	@GetMapping("/checkOrder")
//	public int checkOrder(String orderCode, Model model) {
//		
//		return service.checkOrder(orderCode);
//	}
//	
//	
//	

	
	
	

	
	

}
