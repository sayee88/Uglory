package edu.kh.ugloryC.member.model.dao;

import java.util.List;

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

	/**개별 상품 주문 조회 DAO
	 * @param memberNo
	 * @return
	 */
	public List<OrderHistory> orderHistory(int memberNo) {
		
		
		return sqlSession.selectList("memberMapper.orderList",memberNo);
	}
}
