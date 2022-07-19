package edu.kh.ugloryA.review.model.vo;

import java.util.List;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class ReviewDetail {
	
	private int reviewNo; 
	private String enrollDate;
	private String reviewContent;
	private int starRating;
	
	private String customerName;
	
	private String productName;
	
	private List<ReviewImage> imageList;
	

}
