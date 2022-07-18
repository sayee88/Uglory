package edu.kh.ugloryC.member.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class SubscriptionStatus {

	private int memberNo;
	private String memberName; //회원명
	private String subName;//구독상품이름
	private int subCycle; // 구독 주기
}
