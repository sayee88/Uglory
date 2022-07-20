package edu.kh.ugloryC.member.model.vo;

import java.util.List;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class OrderHistoryDetail {
	//주문정보 / 배송 정보
	private int orderNo; // 주문 번호
	private String memberName; // 회원이름(주문자명)
	private String payDate; // 결제일
	private int totalPrice; // 총가격
	private String orderName; // 수령인
	private String orderPhone; // 수령인 번호
	private String orderAddress; // 수령인 주소
	private String deliveryReq; // 배송 요청사항
	
	private List<OrderHistoryProduct> productList;
}
