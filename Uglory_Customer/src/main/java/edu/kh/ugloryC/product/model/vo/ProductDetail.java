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
	
	private int pCode;
	private int categoryNo;
	private String pName;
    private int pPrice;
    private String pInfo;
    
    private String optionName;
    private int optionPrice;
    
    private int totalPrice;
    private String producer;
    private String origin;
    
    private int starCount;
    private double star; // 0.5단위
    private int reviewCount;
    
    private List<ProductImage> imageList;
}
