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
	private int categoryNo;
	private String productName;
    private int productPrice;
    private String productInfo;
    
    private String producer;
    private String origin;
    
    private int starCount;
    private double star; // 0.5단위
    private int reviewCount;
    
    private List<ProductImage> imageList;
    private List<OptionType> optionList;
    
    private String productState; // 상품상태
}
