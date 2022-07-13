package edu.kh.ugloryC.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.ugloryC.member.model.dao.MemberDAO;
import edu.kh.ugloryC.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO dao;
	
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
	
}
