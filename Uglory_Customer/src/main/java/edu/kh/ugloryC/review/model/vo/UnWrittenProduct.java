package edu.kh.ugloryC.review.model.vo;

import java.util.List;
import java.util.Map;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class UnWrittenProduct {
	
	private String productOrderCode;
	private String productOrderDate;
	private String productName;
	private String optionName;
	private int totalPrice;

	private int reviewCode;

	private int productCode;
	
	private String imgRoot;
	
	private List<Map<String, Object>> optionList;
}
