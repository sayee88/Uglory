package edu.kh.ugloryC.main.model.service;

import java.util.List;

import edu.kh.ugloryC.main.model.vo.DeliveryProduct;
import edu.kh.ugloryC.main.model.vo.RecentReview;

public interface MainService {

	/*
	 * 이번주 배송목록
	 */
	List<DeliveryProduct> thisDeliveryProduct();

	/*
	 * 다음주 배송목록
	 */
	List<DeliveryProduct> nextDeliveryProduct();

	/**
	 * 농장 개수 세기
	 * @return farmCount
	 */
	int farmCount();

	/**
	 * 상품 개수 세기
	 * @return productCount
	 */
	int productCount();

	/**
	 * 최근 리뷰 조회하기
	 * @return reviewList
	 */
	List<RecentReview> selectRecentReview();

}
