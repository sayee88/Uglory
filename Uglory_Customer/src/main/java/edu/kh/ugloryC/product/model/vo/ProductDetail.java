package edu.kh.ugloryC.product.model.vo;

import java.util.List;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class ProductDetail {
	
	private int productCode;
	private String productName;
    private String productPrice;
    private String productInfo;
    
    private String producer;
    private String origin;
    private String productStatus;
    
    private double star; // 0.5단위
    private int reviewNo;

    private List<OptionType> optionList;
    
    private String productState; // 상품상태
}
