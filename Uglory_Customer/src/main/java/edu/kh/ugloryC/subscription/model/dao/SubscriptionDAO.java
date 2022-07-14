package edu.kh.ugloryC.subscription.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SubscriptionDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertSubsOrder(Map<String, Object> orderInfo) {
		
		return sqlSession.insert("subscriptionMapper.insertSubsOrder", orderInfo);
	}

}
