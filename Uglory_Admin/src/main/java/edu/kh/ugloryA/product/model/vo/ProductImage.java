package edu.kh.ugloryA.product.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class ProductImage {
	
	private int productImageNo;
	
	private int productCode;
	
	private String imageRename;
	private String imageRoot;
	private int imageLevel;
	
}
