package edu.kh.ugloryC.subscription.model.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.ugloryC.subscription.model.vo.Delivery;
import edu.kh.ugloryC.subscription.model.vo.OrderInfo;

@Repository
public class SubscriptionDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 주문번호 생성
	public String createSOrderNo(OrderInfo orderInfo) {
		
		String subsOrderNo = sqlSession.selectOne("subscriptionMapper.createSOrderNo", orderInfo);
		
		return subsOrderNo;
	}


	// 첫 배송일 지정 
	public Date createDelDate() {
		return sqlSession.selectOne("subscriptionMapper.createDelDate");
	}

	// 주문 삽입
	public int insertSubsOrder(Map<String, Object> payInfo) {
		
		return sqlSession.insert("subscriptionMapper.insertSubsOrder", payInfo);
	}


	public String checkSubs(int memberNo) {
		return sqlSession.selectOne("subscriptionMapper.checkSubs", memberNo);
	}


	public int insertException(Map<String, Object> payInfo) {
		System.out.println(payInfo);
		
		int result = 0;
		
		if( payInfo.get("choice") != null) {
			result =  sqlSession.insert("subscriptionMapper.exception", payInfo);	
		}
		
		return result;
	}


	public int insertPay(Map<String, Object> payInfo) {
		return sqlSession.insert("subscriptionMapper.insertPay", payInfo);
	}


	public int insertDel(Map<String, Object> payInfo) {
		return sqlSession.insert("subscriptionMapper.insertDel", payInfo);
	}


	// 배송주기가 '1'인 구독 목록 조회
	public List<Delivery> selectEveryList() {
		return sqlSession.selectList("subscriptionMapper.selectEveryList");
	}


	// 매주 수요일 배송중으로 변경
	public int updateDel() {
		return sqlSession.update("subscriptionMapper.updateDel");
	}


	// 매주 구독 결제내역 추가
	public int insertAddPay(Delivery del) {
		return sqlSession.insert("subscriptionMapper.insertAddPay", del);
	}


	// 매주 금요일 배송완으로 변경
	public int updateEveryFri() {
		return sqlSession.update("subscriptionMapper.updateEveryFri");
	}


	// 배송주기가 '2'인 구독 목록 조회
	public List<Delivery> selectBiList() {
		return sqlSession.selectList("subscriptionMapper.selectBiList");
	}


	// 격주 구독 결제내역 추가
	public int insertBiAddPay(Delivery bDel) {
		return sqlSession.insert("subscriptionMapper.insertBiAddPay", bDel);
	}


	// 격주 금요일 배송완으로 변경
	public int updateBiFri() {
		return sqlSession.update("subscriptionMapper.updateBiFri");
	}

	// 격주 수요일 배송중으로 변경
	public int updateBiDel() {
		return sqlSession.update("subscriptionMapper.updateBiDel");
	}


	
	
}
