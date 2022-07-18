package edu.kh.ugloryC.product.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class ProductOrder {
	
	private int productCode;
	private String productOrderName;
	private String productOrderPhone;
	private String productOrderAddr;
    private String productDelReq;
	private int totalPrice;
    
    private int memberNo;
}
