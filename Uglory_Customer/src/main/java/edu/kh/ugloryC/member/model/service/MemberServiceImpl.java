package edu.kh.ugloryC.member.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.ugloryC.member.model.dao.MemberDAO;
import edu.kh.ugloryC.member.model.vo.Member;
import edu.kh.ugloryC.member.model.vo.OrderHistory;
import edu.kh.ugloryC.member.model.vo.SubscriptionStatus;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO dao;
	
	//로그인 서비스 구현 
	@Override
	public Member login(Member inputMember) {
		
		// 같은 이메일이 DB에 존재하는지 확인
		Member loginMember = dao.login(inputMember.getMemberEmail());
		
		if(loginMember != null) return loginMember;
		
		else {
			int memberNo = dao.signUp(inputMember);
			if(memberNo > 0) {
				inputMember.setMemberNo(memberNo);
				return inputMember;
				
			}else {
				
				return null;
			}
			
		}
	}

	// 회원 탈퇴 서비스 구현
	@Override
	public int secession(Map<String, Object> map) {
		
		return dao.secession(map);
	}
	

	// 24시간 경과 후 재가입
	@Override
	public Member reSignUp(String memberEmail) {
		
		int result = dao.reSignUp(memberEmail);
		
		if(result > 0) return dao.login(memberEmail);
		else return null;
	}

	//구독 현황 서비스 구현 
	@Override
	public SubscriptionStatus subscriptionStatus(int memberNo) {

		return dao.subscriptionStatus(memberNo);
	}

	// 내 구독 상품 취소 서비스 구현
	@Override
	public int subCancel(int memberNo) {
	
		return dao.subCancel(memberNo);
	}

	

	
	
}
