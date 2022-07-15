package edu.kh.ugloryC.member.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.ugloryC.member.model.vo.Member;
import edu.kh.ugloryC.member.model.vo.OrderHistory;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 로그인 DAO
	 * @param memberEmail
	 * @return loginMember
	 */
	public Member login(String memberEmail) {
		return sqlSession.selectOne("memberMapper.login", memberEmail);
	}

	/** 회원 가입 DAO
	 * @param inputMember
	 * @return memberNo
	 */
	public int signUp(Member inputMember) {
		int result = sqlSession.insert("memberMapper.signUp", inputMember);
		return result > 0 ? inputMember.getMemberNo() : 0 ; 
	}

	
	// 회원 탈퇴 dao
	public int secession(Map<String, Object> map) {
		return sqlSession.update("memberMapper.secession",map);
	}
	
	// 
	public List<OrderHistory> selectOne() {
		
		return sqlSession.selectList("memberMapper.selectOne");
	}

	public int reSignUp(String memberEmail) {
		return sqlSession.update("memberMapper.reSignUp", memberEmail);
	}


	
	
}

