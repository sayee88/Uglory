package edu.kh.ugloryC.member.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class Member {
	
	private int memberNo;
	private String memberName;
	private String memberEmail;
	private String secessionFlag;
	private String secessionCode;
	private String secessionDate;
	
	private int passStatus;
	
}
