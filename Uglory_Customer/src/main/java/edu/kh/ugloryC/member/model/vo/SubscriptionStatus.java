package edu.kh.ugloryC.member.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class SubscriptionStatus {

	
	private String memberName;
	private String subName;
	private int subCycle;
	
	private int subCount;
}
