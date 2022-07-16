package edu.kh.ugloryC.subscription.model.dao;

import java.util.Date;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SubscriptionDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public String createSOrderNo(Map<String, Object> orderInfo) {
		
		return sqlSession.selectOne("subscriptionMapper.createSOrderNo", orderInfo);
	}

	public int insertSubsOrder(Map<String, Object> payInfo) {
		
		return sqlSession.insert("subscriptionMapper.insertSubsOrder", payInfo);
	}

	public Date createDelDate() {
		return sqlSession.selectOne("subscriptionMapper.createDelDate");
	}

}
