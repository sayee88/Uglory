package edu.kh.ugloryC.member.model.vo;

public class SubHistoryDetail {
	
	private String subOrderNo; // 주문 번호
	private String memberName; // 회원이름(주문자명)
	private String subPayDate; // 결제일
	private int subPayAmount; // 총가격
	private String subOrderName; // 수령인
	private String subOrderPhone; // 수령인 번호
	private String subOrderAddress; // 수령인 주소
	private String subDeliveryReq; // 배송 요청사항
	
	private int pNo; // 상품번호
	private String productName;//상품이름 -> 알러지 제외상품
	
}
