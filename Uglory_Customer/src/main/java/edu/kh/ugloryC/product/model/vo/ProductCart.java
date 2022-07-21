package edu.kh.ugloryC.product.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class ProductCart {
	
	private String productName;
	private String optionName;
	private int productCode;
	private int optionCode;
	private int optionNo;
	private int optionCount;
}
