package edu.kh.ugloryA.payment.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.ugloryA.payment.model.dao.PaymentDAO;
import edu.kh.ugloryA.payment.model.vo.Chart;
import edu.kh.ugloryA.payment.model.vo.MonthlyChart;
import edu.kh.ugloryA.payment.model.vo.Pagination;
import edu.kh.ugloryA.payment.model.vo.Payment;
import edu.kh.ugloryA.payment.model.vo.ProductPaymentDetail;
import edu.kh.ugloryA.payment.model.vo.Refund;
import edu.kh.ugloryA.payment.model.vo.SubsPaymentDetail;

@Service
public class PaymentServiceImpl implements PaymentService {
	

	@Autowired
	private PaymentDAO dao;
	
	private Logger logger = LoggerFactory.getLogger(PaymentServiceImpl.class);

	
	// 전체 결제 내역 조회
	@Override
	public Map<String, Object> selectAllPayment(int cp) {
		
		int listCount = dao.listCount();
		Pagination pagination = new Pagination(cp, listCount);
		
		List<Payment> paymentList = dao.selectAllPayment(pagination);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("pagination", pagination);
		map.put("paymentList", paymentList);
		
		return map;
	}

	
	// 결제 내역 검색 조회
	@Override
	public Map<String, Object> searchPayment(int cp, String key, String query) {
		
		int listCount = dao.searchListCount(key, query);
		Pagination pagination = new Pagination(cp, listCount);
		
		List<Payment> paymentList = dao.searchPayment(key, query, pagination);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("pagination", pagination);
		map.put("paymentList", paymentList);
		
		return map;
	}


	// 개별 상품 상세 조회
	@Override
	public ProductPaymentDetail selectProductPaymentDetail(String payNo) {
		return dao.selectProductPaymentDetail(payNo);
	}


	// 구독 상품 상세 조회
	@Override
	public SubsPaymentDetail selectSubsPaymentDetail(String payNo) {
		return dao.selectSubsPaymentDetail(payNo);
	}


	// 당일 매출
	@Override
	public int dailySales() {
		return dao.dailySales();
	}


	// 총 매출
	@Override
	public int totalSales() {
		return dao.totalSales();
	}


	// 환불 내역 조회
	@Override
	public List<Refund> selectRefundList() {
		return dao.selectRefundList();
	}
	
	
	// 개별 상품 결제 건수 
	@Override
	public int prodPaymentCount() {
		return dao.prodPaymentCount();
	}


	// 환불 요청 건수
	@Override
	public int refundCount() {
		return dao.refundCount();
	}


	// 환불 완료 건수
	@Override
	public int refundDone() {
		return dao.refundDone();
	}


	// 구독 건수
	@Override
	public int subsCount() {
		return dao.subsCount();
	}


	// 환불 처리
	@Override
	public int refundHandling(String orderCode) {
		return dao.refundHandling(orderCode);
	}


	// 일별 차트 데이터 조회
	@Override
	public Chart selectChartData() {
		return dao.selectChartData();
	}


	// 월별 차트 데이터 조회
	@Override
	public List<MonthlyChart> selectMonthlyChartData() {
		return dao.selectMonthlyChartData();
	}


	
	
	
	
	

	
	
	

	
	
	
	
	
	
	
	

}
