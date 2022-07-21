package edu.kh.ugloryC.subscription.model.vo;

import java.util.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class Delivery {
	
	private String subsOrderCode;
	private String sCancel;
	private int cycle;
	private int memberNo;
	private int box;
	private int amount;
	private String payNo;
	private Date payDate;
	

}
