package edu.kh.ugloryA.product.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class WeeklyProduct {
	
	private int productNo;
	private int productListNo;
	private int optionCode;
	
	private String productName;
	private String optionName;

}
