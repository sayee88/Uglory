package edu.kh.ugloryC.main.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class DeliveryProduct {
	
	//private int delProductNo;
	private String productCategory;
	private String productName;
	private String optionName;
	private String price;
	private String thumbnail;
	
}
