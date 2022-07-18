package edu.kh.ugloryC.product.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class ProductList {
	
	private int productCode;
	private String productName;
	private int productPrice;
	private String imgRoot; // 이미지 주소
	private String categoryName;
    private int starCount; // 리뷰 개수
	private double starAvg; // 0.5단위
	
    private String productState; // 상품상태

	
}
