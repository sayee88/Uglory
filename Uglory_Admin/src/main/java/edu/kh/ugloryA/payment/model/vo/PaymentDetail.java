package edu.kh.ugloryA.payment.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class PaymentDetail {
	
	// 공통
	private String orderCode; // 주문번호
	private String payAmount; // 결제 금액
	private String payDate; // 결제일
	
	private String customerEmail; // 주문자 아이디
	private String customerName; // 주문자 이름
	
	private String deliveryAddress; // 배송지
	private String deliveryStatement; // 배송 상태
	private String deliveryRequest; // 배송 요청사항
	
	// 개별 상품 관련
	private String orderDate; // 주문일
	
	private String productName; // 상품명(바나나)
	private String optionName; // 옵션 이름(1kg)
	
	// 구독 상품 관련
	private String deliveryDate; // 배송일
	private String subscriptionName; // 구독 상품 이름
	private String subscriptionCycle; // 구독 주기
	private String subscriptionException; // 구독 제외 상품
	


}
