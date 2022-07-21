package edu.kh.ugloryC.member.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class OrderHistoryProduct {
	private String orderNo;
	private String productName; // 상품 이름
	private String productPrice; // 상품 가격
	private String optionPrice; // 옵션 가격 
	private String optionName; // 옵션이름
	private int optionCount; // 옵션 개수
	private String deliveryFlag; // 배송 상태
	private String imageRename; // 상품 이미지
}
