package edu.kh.ugloryA.payment.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class Chart {

	private String chartDate; // 최근 일주일 날짜
	private String subsPerDate; // 구독 금액 총합
	private String productPerDate; // 상품 금액 총합
}
