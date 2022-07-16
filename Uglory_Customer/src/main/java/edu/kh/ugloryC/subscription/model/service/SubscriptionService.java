package edu.kh.ugloryC.subscription.model.service;

import java.util.Map;

import edu.kh.ugloryC.member.model.vo.Member;

public interface SubscriptionService {

	// 주문번호 생성
	String createSOrderNo(Map<String, Object> orderInfo);
	
	// 주문 삽입
	int insertSubsOrder(Map<String, Object> payInfo);

}
