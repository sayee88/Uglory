package edu.kh.ugloryA.product.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class Product {
	
	private int productCode;
	
	private int productCategoryNo;
	private String productCategory;
	
	private int farmNo;
	
	private String productName;
	private int productPrice;
	private char productState;
	private String productInfo;
	
	private Date productDate;
	private Date productUpdate;
	
}
