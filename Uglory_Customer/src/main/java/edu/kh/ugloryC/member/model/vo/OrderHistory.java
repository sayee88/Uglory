package edu.kh.ugloryC.member.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class OrderHistory {
	
	private String orderDate;// 주문 날짜
	private String productName; // 상품 이름
	private String origin; // 원산지
	private int orderNo; // 주문번호
	private int totalPrice; // 총가격
	private String deliveryFlag; // 배송 상태
	private String productPrice; // 상품 가격
	private String memberName; // 회원이름
	private String orderName; // 수령인
	private String orderPhone; // 수령인 번호
	private String orderAddress; // 수령인 주소
	private String deliveryReq; // 배송 요청사항
	private String payDate; // 결제일
	private String optionName; // 옵션이름 
	// 상품 이미지
	
	
	
	

}
