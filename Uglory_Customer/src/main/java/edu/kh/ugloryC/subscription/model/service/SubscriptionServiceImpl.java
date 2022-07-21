package edu.kh.ugloryC.subscription.model.service;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.ugloryC.member.model.vo.Member;
import edu.kh.ugloryC.subscription.model.dao.SubscriptionDAO;
import edu.kh.ugloryC.subscription.model.vo.OrderInfo;

@Service
public class SubscriptionServiceImpl implements SubscriptionService{
	
	@Autowired
	private SubscriptionDAO dao;
	



	@Override
	public String createSOrderNo(OrderInfo orderInfo) {
						
		String subsOrderNo = dao.createSOrderNo(orderInfo);
		
		return subsOrderNo;
	}


	@Override
	public Date setFirstDelDate() {
		
		// 첫 배송일 생성 SQL
		Date firstDelDate = dao.createDelDate();
		return firstDelDate;
	}

	
	@Override
	public int insertSubsOrder(Map<String, Object> payInfo) {
		
		// 주문 삽입 SQL
		int result = dao.insertSubsOrder(payInfo);
		
		// 구독 제외 상품 삽입
		int exception = dao.insertException(payInfo);
		
		// 구독 배송 내역 삽입
		int del = dao.insertDel(payInfo);
		
		int subPay = dao.insertPay(payInfo);
		
		return result;
	}


	@Override
	public String checkSubs(int memberNo) {
		return dao.checkSubs(memberNo);
	}

	
}
