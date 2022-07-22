package edu.kh.ugloryA.payment.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
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
import edu.kh.ugloryA.payment.model.vo.Chart;
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
	
	
	@GetMapping("/PPaymentDetail/{orderCode}")
	public String selectProductPaymentDetail(@PathVariable("orderCode") String orderCode, Model model) {
		
		ProductPaymentDetail pPaymentDetail = (ProductPaymentDetail)service.selectProductPaymentDetail(orderCode);
		
		model.addAttribute("pPaymentDetail", pPaymentDetail);
		
		return "managePayment/ProductPaymentDetail";
	}
	
	
	@GetMapping("/SPaymentDetail/{orderCode}")
	public String selectSubsPaymentDetail(@PathVariable("orderCode") String orderCode, Model model) {
		
		
		SubsPaymentDetail sPaymentDetail = (SubsPaymentDetail)service.selectSubsPaymentDetail(orderCode);
		
		model.addAttribute("sPaymentDetail", sPaymentDetail);
		
		return "managePayment/SubsPaymentDetail";
	}
	
	@GetMapping("/refundList")
	public String selectRefundList(Model model) {
		
		int prodPaymentCount = service.prodPaymentCount();
		
		int refundCount = service.refundCount();
		
		int refundDone = service.refundDone();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("prodPaymentCount", prodPaymentCount);
		map.put("refundCount", refundCount);
		map.put("refundDone", refundDone);
		
		List<Refund> refundList = service.selectRefundList();
		
		map.put("refundList", refundList);
		
		model.addAttribute("map", map);
		
		return "managePayment/SalesList";
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

	
	
	
//	// 매출 per day 차트 데이터 조회
//	@GetMapping
//	public String selectChartData(Model model) {
//		
//		Chart chart = service.selectChartData();
//		
//		// 가져온 값을 ,를 기준으로 나눠야? 하나용????? 
//		
//		
//		return null;
//	}
	
	

}
