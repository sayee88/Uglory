package edu.kh.ugloryA.myPage.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class Admin {
	
	private int adminNo;
	private String adminEmail;
	private String adminPw;
	private String adminName;
	private String profileImage;

}
