package edu.kh.ugloryC.product.model.vo;

import org.springframework.stereotype.Service;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class ProductOrder {
	
	private int productCode;
	private String productName;
	private String productOrderName;
	private String productOrderPhone;
	private String productOrderAddr;
    private String productDelReq;
	private int totalPrice;
    private String opionName;
    private int productCount;
    private int deliveryCode;
    
	private int optionCode;
	private String optionCount;
   
    private int memberNo;
}
