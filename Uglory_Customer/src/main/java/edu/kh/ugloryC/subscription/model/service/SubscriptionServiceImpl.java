package edu.kh.ugloryC.subscription.model.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.ugloryC.member.model.vo.Member;
import edu.kh.ugloryC.subscription.model.dao.SubscriptionDAO;

@Service
public class SubscriptionServiceImpl implements SubscriptionService{
	
	@Autowired
	private SubscriptionDAO dao;

	@Override
	public int insertSubsOrder(Map<String, Object> orderInfo) {
		return dao.insertSubsOrder(orderInfo);
	}

	
}
