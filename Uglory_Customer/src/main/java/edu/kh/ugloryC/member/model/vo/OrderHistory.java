package edu.kh.ugloryC.member.model.vo;

import java.util.List;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class OrderHistory {
	//주문내역
	private int orderNo; // 주문번호
	private String origin; // 원산지
	private String deliveryFlag; // 배송 상태
	private String orderDate;// 주문 날짜
	private int totalPrice; // 총가격
	private int count; // 상품 개수 - 1개

}
