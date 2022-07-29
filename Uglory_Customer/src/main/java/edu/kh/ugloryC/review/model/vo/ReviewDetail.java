package edu.kh.ugloryC.review.model.vo;

import java.util.List;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


//모달
@Getter
@Setter
@NoArgsConstructor
public class ReviewDetail {
	
	private int reviewNo;
	
	private int memberNo;
	private String memberName;
	
	private String reviewEnrollDate;
	private String updateDate;
	
	private int reviewCode;
	
	private double starRating;
	
	private String reviewContent;
	
	private List<ReviewImage> imageList;

}
