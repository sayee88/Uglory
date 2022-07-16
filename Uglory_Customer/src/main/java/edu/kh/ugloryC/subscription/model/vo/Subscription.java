package edu.kh.ugloryC.subscription.model.vo;

import java.util.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class Subscription {
	
	// 구독 상품 주문
	private String orderNo;// 구독 상품 주문 코드
	private String orderName;// 수령인 이름
	private String orderPhone;// 수령인 전화번호
	private String orderAddress;// 수령인 주소
	private String delText;// 배송요청사항
	private Date firstDelDate;// 첫 배송일
	private int cycle;// 배송주기
	private int memberNo;// 회원번호
	private int box;// 구독 상품 코드
	
	// 구독 결제
	private String payNo;// 구독 결제 번호 
	private int amount;// 구독 결제금액

}
