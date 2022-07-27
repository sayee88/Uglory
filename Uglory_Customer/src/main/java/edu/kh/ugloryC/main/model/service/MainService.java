package edu.kh.ugloryC.main.model.service;

import java.util.List;

import edu.kh.ugloryC.main.model.vo.DeliveryProduct;

public interface MainService {

	/*
	 * 이번주 배송목록
	 */
	List<DeliveryProduct> thisDeliveryProduct();

	/*
	 * 다음주 배송목록
	 */
	List<DeliveryProduct> nextDeliveryProduct();

}
