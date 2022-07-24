package edu.kh.ugloryA.payment.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class MonthlyChart {

	private String period; // 월 
	private String productPerMonth; // 월별 개별상품 판매 총액
	private String subsPerMonth; // 월별 구독 판매 총액
	private String totalPerMonth; // 월별 판매 총액
}
