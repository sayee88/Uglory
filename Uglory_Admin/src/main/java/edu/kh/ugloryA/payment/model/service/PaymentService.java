package edu.kh.ugloryA.payment.model.service;

import java.util.List;
import java.util.Map;

import edu.kh.ugloryA.payment.model.vo.Chart;
import edu.kh.ugloryA.payment.model.vo.MonthlyChart;
import edu.kh.ugloryA.payment.model.vo.Payment;
import edu.kh.ugloryA.payment.model.vo.ProductPaymentDetail;
import edu.kh.ugloryA.payment.model.vo.Refund;
import edu.kh.ugloryA.payment.model.vo.SubsPaymentDetail;

public interface PaymentService {

	/**
	 * 전체 결제 내역 조회
	 * @param cp 
	 * @return paymentList
	 */
	Map<String, Object> selectAllPayment(int cp);

	
	/**
	 * 결제 내역 검색 조회
	 * @param cp 
	 * @param key
	 * @param query
	 * @return paymentList
	 */
	Map<String, Object> searchPayment(int cp, String key, String query);


	/**
	 * 개별 상품 상세 조회 
	 * @param payNo
	 * @return
	 */
	ProductPaymentDetail selectProductPaymentDetail(String payNo);


	/**
	 * 구독 상품 상세 조회
	 * @param payNo
	 * @return
	 */
	SubsPaymentDetail selectSubsPaymentDetail(String payNo);


	/**
	 * 당일 매출
	 * @return
	 */
	int dailySales();


	/**
	 * 총 매출
	 * @return
	 */
	int totalSales();


	/**
	 * 환불 내역 조회
	 * @return
	 */
	List<Refund> selectRefundList();


	/**
	 * 개별 상품 결제 건수 
	 * @return
	 */
	int prodPaymentCount();


	/**
	 * 환불 요청 건수
	 * @return
	 */
	int refundCount();


	/**
	 * 환불 완료 건수
	 * @return
	 */
	int refundDone();


	/**
	 * 구독 건수
	 * @return
	 */
	int subsCount();


	/**
	 * 환불 처리
	 * @param orderCode
	 * @return
	 */
	int refundHandling(String orderCode);


	/**
	 * 일별 차트 데이터 조회
	 * @return
	 */
	Chart selectChartData();


	/**
	 * 월별 차트 데이터 조회
	 * @return
	 */
	List<MonthlyChart> selectMonthlyChartData();





}
