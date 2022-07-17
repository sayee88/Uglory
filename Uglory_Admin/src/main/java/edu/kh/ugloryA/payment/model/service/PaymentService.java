package edu.kh.ugloryA.payment.model.service;

import java.util.List;

import edu.kh.ugloryA.payment.model.vo.Payment;
import edu.kh.ugloryA.payment.model.vo.PaymentDetail;

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
	PaymentDetail selectProductPaymentDetail(String orderCode);


	/**
	 * 구독 상품 상세 조회
	 * @param orderCode
	 * @return
	 */
	List<PaymentDetail> selectSubsPaymentDetail(String orderCode);

}
