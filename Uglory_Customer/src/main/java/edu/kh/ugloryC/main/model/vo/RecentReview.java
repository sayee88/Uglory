package edu.kh.ugloryC.main.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class RecentReview {
	
	private int starRating; //STAR_RATING
	private String productName; //PRODUCT_NM
	private String reviewEnrollDate; //REVIEW_ENROLL_DT
	private String memberName; //MEMBER_NAME
	private String reviewContent; //REVIEW_CONTENT
	private String thumbnail;//THUMBNAIL
	
}
