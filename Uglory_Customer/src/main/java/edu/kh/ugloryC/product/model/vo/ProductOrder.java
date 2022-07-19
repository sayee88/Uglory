package edu.kh.ugloryC.product.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class ProductOrder {
	
	private String productCode;
	private String productOrderDate;
	private String productOrderName;
	private String productOrderPhone;
	private String productOrderAddr;
    private String productDelReq;
	private int totalPrice;
    private String productReviewStatus;
    private int memberNo;
    private int deliveryCode;
}
