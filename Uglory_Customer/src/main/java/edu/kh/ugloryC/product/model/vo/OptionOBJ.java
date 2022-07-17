package edu.kh.ugloryC.product.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class OptionOBJ {
	
	private int productCode;
	private int optionCode;
	private int optionCount;
	private int totalAmount;
	private String optionName;
	private String productName;
	
}
