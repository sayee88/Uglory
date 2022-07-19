package edu.kh.ugloryC.member.model.service;

import java.util.List;
import java.util.Map;

import edu.kh.ugloryC.member.model.vo.Member;
import edu.kh.ugloryC.member.model.vo.OrderHistory;
import edu.kh.ugloryC.member.model.vo.SubscriptionStatus;

public interface MemberService {
	
	// 로그인 Service
	Member login(Member inputMember);

	//회원 탈퇴 서비스
	int secession(Map<String, Object> map);
	
	
	// 24시간 경과 후 재가입
	Member reSignUp(String memberEmail);

	//내구독현황 
	SubscriptionStatus subscriptionStatus(int memberNo);

	//내 구독 상품 취소
	int subCancel(int memberNo);

	//개별 상품 주문 내역 조회
	List<OrderHistory> selectOrderList(int orderNo);

	List<OrderHistory> selectOrderHistoryList(int memberNo);



}
