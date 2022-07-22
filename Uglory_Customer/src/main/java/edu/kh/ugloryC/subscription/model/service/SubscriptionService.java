package edu.kh.ugloryC.subscription.model.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import edu.kh.ugloryC.member.model.vo.Member;
import edu.kh.ugloryC.product.model.vo.ProductList;
import edu.kh.ugloryC.subscription.model.vo.Delivery;
import edu.kh.ugloryC.subscription.model.vo.OrderInfo;

public interface SubscriptionService {

	// 주문번호 생성
	String createSOrderNo(OrderInfo orderInfo);
	
	// 주문 삽입
	int insertSubsOrder(Map<String, Object> payInfo);

	// 첫배송일 지정
	Date setFirstDelDate();

	// 구독 여부 확인
	String checkSubs(int memberNo);

	// 배송주기가 '1'인 구독 목록 조회
	List<Delivery> selectEveryList();

	// 매주 금요일 배송완으로 변경 
	int updateEveryFri();

	// 배송주기가 '2'인 구독 목록 조회
	List<Delivery> selectbiList();

	// 격주 금요일 배송완으로 변경
	int updateBiFri();

	// 상품 리스트 조회(구독 제외 상품 조회용)
	List<ProductList> selectProductList();

}
