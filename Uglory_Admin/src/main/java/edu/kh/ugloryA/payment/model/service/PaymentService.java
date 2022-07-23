package edu.kh.ugloryA.payment.model.service;

import java.util.List;

import edu.kh.ugloryA.payment.model.vo.Chart;
import edu.kh.ugloryA.payment.model.vo.Payment;
import edu.kh.ugloryA.payment.model.vo.ProductPaymentDetail;
import edu.kh.ugloryA.payment.model.vo.Refund;
import edu.kh.ugloryA.payment.model.vo.SubsPaymentDetail;

public interface PaymentService {

	/**
	 * 전체 결제 내역 조회
	 * @return paymentList
	 */
	List<Payment> selectAllPayment();

	
	/**
	 * 결제 내역 검색 조회
	 * @param key
	 * @param query
	 * @return paymentList
	 */
	List<Payment> searchPayment(String key, String query);


	/**
	 * 주문 번호로 개별 or 구독 여부 확인
	 * @param orderCode
	 * @return
	 */
	int checkOrder(String orderCode);


	/**
	 * 개별 상품 상세 조회 
	 * @param orderCode
	 * @return
	 */
	ProductPaymentDetail selectProductPaymentDetail(String orderCode);


	/**
	 * 구독 상품 상세 조회
	 * @param orderCode
	 * @return
	 */
	SubsPaymentDetail selectSubsPaymentDetail(String orderCode);


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



}
