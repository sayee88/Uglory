package edu.kh.ugloryA.payment.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class Payment {

	private String orderCode; // 주문번호
	private String payAmount; // 결제 금액
	private String payDate; // 결제일
	
	private String customerEmail; // 주문자 아이디
	private String customerName; // 주문자 이름
	
	private String deliveryAddress; // 배송지
	private String deliveryStatement; // 배송 상태
	private String deliveryRequest; // 배송 요청사항
	
	private String orderDate; // 주문일
	
	private String productName; // 상품명(바나나)
	private String optionName; // 옵션 이름(1kg)
}
