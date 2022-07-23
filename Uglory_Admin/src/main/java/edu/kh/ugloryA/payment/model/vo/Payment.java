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
	private String sort; // 구독 or 개별상품 구분 
	
}
