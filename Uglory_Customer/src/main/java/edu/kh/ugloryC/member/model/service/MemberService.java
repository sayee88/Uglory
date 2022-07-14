package edu.kh.ugloryC.member.model.service;

import java.util.List;

import edu.kh.ugloryC.member.model.vo.Member;
import edu.kh.ugloryC.member.model.vo.OrderHistory;

public interface MemberService {
	
	// 로그인 Service
	Member login(Member inputMember);

	// 개별 상품 주문 조회 Service
	List<OrderHistory> orderHistory(int memberNo);

}
