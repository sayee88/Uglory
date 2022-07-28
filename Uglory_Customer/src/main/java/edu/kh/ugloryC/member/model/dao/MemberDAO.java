package edu.kh.ugloryC.member.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.google.gson.JsonElement;

import edu.kh.ugloryC.member.model.vo.Member;
import edu.kh.ugloryC.member.model.vo.OrderHistory;
import edu.kh.ugloryC.member.model.vo.OrderHistoryDetail;
import edu.kh.ugloryC.member.model.vo.Pagination;
import edu.kh.ugloryC.member.model.vo.SubHistory;
import edu.kh.ugloryC.member.model.vo.SubHistoryDetail;
import edu.kh.ugloryC.member.model.vo.SubscriptionStatus;

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
	
	
	
	public List<OrderHistory> selectOne() {
		
		return sqlSession.selectList("memberMapper.selectOne");
	}

	//재가입 DAO
	public int reSignUp(String memberEmail) {
		return sqlSession.update("memberMapper.reSignUp", memberEmail);
	}

	//내구독 현황 DAO
	public SubscriptionStatus subscriptionStatus(int memberNo) {
		
		return sqlSession.selectOne("memberMapper.subscriptionStatus", memberNo);
	}

	// 내 구독 상품 취소 dao
	public int subCancel(int memberNo) {
	
		return sqlSession.update("memberMapper.subCancel",memberNo);
	}

	// 개별 상품 주문 목록 조회 DAO
	public List<OrderHistory> selectOrderHistoryList(int memberNo,Pagination pagination) {
		
		int offset = (pagination.getCurrentPage()-1) * pagination.getLimit();
		
		RowBounds rowbounds = new RowBounds(offset, pagination.getLimit());
	
		return sqlSession.selectList("memberMapper.selectOrderHistoryList",memberNo,rowbounds);
	}

	//개별 상품 상세 주문 조회 DAO
	public OrderHistoryDetail selectOrderHistoryDetail(String orderNo) {
		return sqlSession.selectOne("memberMapper.selectOrderHistoryDetail", orderNo);
	}

	// 구독 상품 주문 목록 조회 DAO
	public List<SubHistory> selectSubHistoryList(int memberNo) {

		return sqlSession.selectList("memberMapper.selectSubHistoryList",memberNo);
	}
	// 구독 상품 주문 상세 조회
	public SubHistoryDetail selectSubHistoryDetail(String subOrderNo) {
	
		return sqlSession.selectOne("memberMapper.selectSubHistoryDetail",subOrderNo);
	}

	// 개별 상품 주문 환불 
	public int productCancel(String orderNo) {
		
		return sqlSession.insert("memberMapper.productCancel",orderNo);
	}

	public int listCount(int memberNo) {
		
		return sqlSession.selectOne("memberMapper.listCount",memberNo);
	}



	


	
	
}

