package edu.kh.ugloryC.subscription.model.service;

import java.util.Date;
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
	public String createSOrderNo(Map<String, Object> orderInfo) {
		String sOrderNo = dao.createSOrderNo(orderInfo);
		return sOrderNo;
	}
	

	@Override
	public int insertSubsOrder(Map<String, Object> payInfo) {
		
		// 첫 배송일 생성 SQL
		Date firstDelDate = dao.createDelDate();
		payInfo.put("firstDelDate", firstDelDate);
		
		// 주문 삽입 SQL
		int result = dao.insertSubsOrder(payInfo);
		
		
		return result;
	}

	

	
}
