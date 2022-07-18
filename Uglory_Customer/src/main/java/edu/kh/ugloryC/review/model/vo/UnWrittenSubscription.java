package edu.kh.ugloryC.review.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class UnWrittenSubscription {

	private int subOrderCode;
	private String subDate;
	private int reviewCode;
	private String subName;
	private int subPrice;
	
}
