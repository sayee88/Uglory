package edu.kh.ugloryC.review.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class UnWrittenProduct {
	
	private int productOrderCode;
//	private String productImage;
	private String productOrderDate;
	private String productName;
	private String optionName;
	private int totalPrice;

	private int reviewCode;

	private int productCode;
}
