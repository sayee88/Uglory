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

	private String payNo; // 결제 번호
	private String payDate; // 결제일
	private String customerName; // 주문자 이름
	private String sort; // 구독 or 개별상품 구분 
	
}
