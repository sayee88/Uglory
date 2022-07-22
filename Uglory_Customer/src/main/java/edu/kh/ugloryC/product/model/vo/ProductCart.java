package edu.kh.ugloryC.product.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class ProductCart {
	
	private int categoryNo;
	private int productCode;
	private String productName;
	private int productPrice;
	private int optionCode;
	private String optionName;
	private int optionPrice;
	private int optionNo;
	
	private int optionCount;
}
