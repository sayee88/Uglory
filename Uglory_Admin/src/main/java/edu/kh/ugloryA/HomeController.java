package edu.kh.ugloryA;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.kh.ugloryA.customer.model.service.CustomerService;
import edu.kh.ugloryA.payment.model.service.PaymentService;
import edu.kh.ugloryA.payment.model.vo.Chart;
import edu.kh.ugloryA.review.model.service.ReviewService;

@Controller
public class HomeController {
	

	@Autowired
	private CustomerService cService;
	
	@Autowired
	private ReviewService rService;
	
	@Autowired
	private PaymentService pService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		// 회원 수 조회
		int countCustomer = cService.countCustomer();
		
		
		// 리뷰 수 조회
		int countReview = rService.countReview();
		
		
		// 당일 매출
		int dailySales = pService.dailySales();
		
		
		// 총 매출
		int totalSales = pService.totalSales();
		
		// 매출 per day 차트 데이터 조회
		Chart chartData = pService.selectChartData();
		
		
		Map<String, Object> mainDataMap = new HashMap<String, Object>();
		
		mainDataMap.put("countCustomer", countCustomer);
		mainDataMap.put("countReview", countReview);
		mainDataMap.put("dailySales", dailySales);
		mainDataMap.put("totalSales", totalSales);
		mainDataMap.put("chartData", chartData);
		
		model.addAttribute("mainDataMap", mainDataMap);
		
		return "home";
	}

	
}
