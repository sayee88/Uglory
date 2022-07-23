package edu.kh.ugloryA.customer.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class Customer {

	private int customerNo;
	private String customerEmail;
	private String customerName;
	private int subscriptionFlag;
	private String accountFlag;
}
