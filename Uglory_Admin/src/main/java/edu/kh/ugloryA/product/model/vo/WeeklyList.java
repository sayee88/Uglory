package edu.kh.ugloryA.product.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class WeeklyList {
	
	private int productListNo;
	private char expectedUploadDate;
	private Date deliveryDate;

}
