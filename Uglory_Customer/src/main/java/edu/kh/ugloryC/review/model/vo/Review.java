package edu.kh.ugloryC.review.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@Getter
@Setter
@NoArgsConstructor
public class Review {
	
	private int reviewNo;
	private String reviewContent;
	private Date reviewEnrollDate;
	private int starRating;
	private int reviewCode;
}
