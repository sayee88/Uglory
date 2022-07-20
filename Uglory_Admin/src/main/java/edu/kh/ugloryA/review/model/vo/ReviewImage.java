package edu.kh.ugloryA.review.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class ReviewImage {

	private int reviewImageNo;
	private String reviewImageRename;
	private int reviewImageLevel;
	private int reviewNo;
}
