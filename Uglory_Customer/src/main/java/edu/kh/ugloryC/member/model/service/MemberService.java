package edu.kh.ugloryC.member.model.service;

import java.util.List;
import java.util.Map;

import edu.kh.ugloryC.member.model.vo.Member;
import edu.kh.ugloryC.member.model.vo.OrderHistory;

public interface MemberService {
	
	// 로그인 Service
	Member login(Member inputMember);

	//회원 탈퇴 서비스
	int secession(Map<String, Object> map);
	
	
	// 개별 상품 조회 첫번째 뜨는 창
	List<OrderHistory> selectOne();

	// 24시간 경과 후 재가입
	Member reSignUp(String memberEmail);


	

}
