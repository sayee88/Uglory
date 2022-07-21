package edu.kh.ugloryC.subscription.model.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.ugloryC.member.model.vo.Member;
import edu.kh.ugloryC.subscription.model.dao.SubscriptionDAO;
import edu.kh.ugloryC.subscription.model.vo.Delivery;
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

	// 첫 배송일 지정
	@Override
	public Date setFirstDelDate() {
		
		Date firstDelDate = dao.createDelDate();
		return firstDelDate;
	}

	// 주문 삽입
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

	// 구독 여부 확인
	@Override
	public String checkSubs(int memberNo) {
		return dao.checkSubs(memberNo);
	}


	// 매주
	@Override
	public List<Delivery> selectEveryList() {
		
		// 배송주기가 '1'인 구독 목록 조회
		List<Delivery> everyOneList =  dao.selectEveryList();
		
		// 배송주기 '1'인 사람 중 배송 전인 사람 '배송중'으로 update
		int updateIng = dao.updateDel();
		
		for(Delivery del : everyOneList) {
			
			// 결제 번호 생성
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
			String date = sdf.format(new Date());
			int random = (int)(Math.random() * 10000);
			String payNo = "SP" + date + "-" + random;
			
			del.setPayNo(payNo);
			// 구독 결제 추가 
			int insertAddPay = dao.insertAddPay(del);
		}
		
			
		
		return everyOneList;
	}

	// 매주 금요일 배송완으로 변경
	@Override
	public int updateEveryFri() {
		return dao.updateEveryFri();
	}

	// 격주
	@Override
	public List<Delivery> selectbiList() {
		// 배송주기가 '2'인 구독 목록 조회
		List<Delivery> biList = dao.selectBiList();
		
		// 배송주기 '2'인 사람 중 배송 전인 사람 '배송중'으로 update
		int updateIng = dao.updateBiDel();
		
		for(Delivery bDel : biList) {
			
			// 결제 번호 생성
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
			String date = sdf.format(new Date());
			int random = (int)(Math.random() * 10000);
			String payNo = "SP" + date + "-" + random;
			
			bDel.setPayNo(payNo);
			int insertBiAddPay = dao.insertBiAddPay(bDel);
		}
				
		// 구독 결제 추가 
		
		return biList;
	}

	// 격주 금요일 배송완으로 변경
	@Override
	public int updateBiFri() {
		return dao.updateBiFri();
	}

	
}
