package edu.kh.ugloryC.product.model.vo;

import java.util.List;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class OptionType {
	
	private int optionCode;
	private String optionName;
	private String optionPrice;
	private String productName;
	private int productCode;
	private int productCategoryNo;
	private int optionCount;
	
	private int optionNo;
	
	private List<Integer> optionNoList;

}
