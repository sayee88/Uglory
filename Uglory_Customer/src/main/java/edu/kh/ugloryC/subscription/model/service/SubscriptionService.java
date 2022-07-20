package edu.kh.ugloryC.subscription.model.service;

import java.util.Date;
import java.util.Map;

import edu.kh.ugloryC.member.model.vo.Member;
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

}
