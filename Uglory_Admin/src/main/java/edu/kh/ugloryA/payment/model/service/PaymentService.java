package edu.kh.ugloryA.payment.model.service;

import java.util.List;

import edu.kh.ugloryA.payment.model.vo.Payment;

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

}
