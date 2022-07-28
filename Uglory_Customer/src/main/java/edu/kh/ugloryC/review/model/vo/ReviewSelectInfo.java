package edu.kh.ugloryC.review.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class ReviewSelectInfo {
	
	private int reviewTotalCount;
	private int starAvg;
	private int myReviewCount;
	private int unWrittenCount;
	
	private int reviewCode;
	
	private int reviewNo;
	private String reviewContent;
	private String reviewEnrollDate;
	private double starRating;
	
	private int memberNo;
	private String memberName;
	
	private String thumbnail;
	
	// 구독주문코드, 상품주문코드, 상품코드 추가
	private String subOrderCode;
	private String productOrderCode;
	private int productCode;
	
	

}
