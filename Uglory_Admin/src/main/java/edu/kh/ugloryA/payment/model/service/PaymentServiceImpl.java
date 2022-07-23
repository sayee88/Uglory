package edu.kh.ugloryA.payment.model.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.ugloryA.payment.model.dao.PaymentDAO;
import edu.kh.ugloryA.payment.model.vo.Chart;
import edu.kh.ugloryA.payment.model.vo.MonthlyChart;
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
	public List<Payment> selectAllPayment() {
		return dao.selectAllPayment();
	}

	
	// 결제 내역 검색 조회
	@Override
	public List<Payment> searchPayment(String key, String query) {
		return dao.searchPayment(key, query);
	}


	// 주문 번호로 개별 or 구독 여부 확인
	@Override
	public int checkOrder(String orderCode) {
		return dao.checkOrder(orderCode);
	}


	// 개별 상품 상세 조회
	@Override
	public ProductPaymentDetail selectProductPaymentDetail(String orderCode) {
		return dao.selectProductPaymentDetail(orderCode);
	}


	// 구독 상품 상세 조회
	@Override
	public SubsPaymentDetail selectSubsPaymentDetail(String orderCode) {
		return dao.selectSubsPaymentDetail(orderCode);
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
