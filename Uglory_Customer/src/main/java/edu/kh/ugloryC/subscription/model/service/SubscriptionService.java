package edu.kh.ugloryC.subscription.model.service;

import java.util.Map;

import edu.kh.ugloryC.member.model.vo.Member;

public interface SubscriptionService {

	int insertSubsOrder(Map<String, Object> orderInfo);
	

}
