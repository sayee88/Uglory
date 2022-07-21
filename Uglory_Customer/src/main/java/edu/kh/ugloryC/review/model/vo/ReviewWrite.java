package edu.kh.ugloryC.review.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@Getter
@Setter
@NoArgsConstructor
public class ReviewWrite {
	
	private int reviewNo;
	private String reviewContent;
	private int starRating;
	private int reviewCode;
	private int memberNo;
	
	private String productOrderDate;
	private String productName;
	private String optionName;
	private int totalPrice;
	
	private int productCode;
	private String productOrderCode;
	private String subOrderCode;
	
}
