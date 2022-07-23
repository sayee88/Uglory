package edu.kh.ugloryA.payment.model.vo;

import java.util.List;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class Refund {

	private String orderCode;
	private int refundAmount;
	private String refundDate;
	private String orderDate;
	private String customerEmail;
	private String customerName;
	private String refundStatement;
	
	private List<Option> optionList;
}
