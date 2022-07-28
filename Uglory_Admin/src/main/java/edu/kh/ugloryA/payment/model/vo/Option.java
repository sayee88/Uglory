package edu.kh.ugloryA.payment.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class Option {

	private String payNo;
	private String orderCode;
	private String optionName;
	private String productName;
	private String optionCount;
}
