package edu.kh.ugloryC.common.scheduling;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import edu.kh.ugloryC.subscription.model.service.SubscriptionService;
import edu.kh.ugloryC.subscription.model.vo.Delivery;

import java.util.List;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Component
public class DeliveryUpdateScheduling {
	
	private Logger logger = LoggerFactory.getLogger(DeliveryUpdateScheduling.class);
	
	@Autowired
	private SubscriptionService service;
	
	
	
	
	// 매주
	@Scheduled(cron="0 0 15 * * 4") // 매주 수요일 3시마다
//	@Scheduled(cron="0 3 * * * *") // 테스트용
	public void updateEvery() {
		
		List<Delivery> everyList = service.selectEveryList();
		logger.info("배송중");
	}
	
	@Scheduled(cron="0 0 15 * * 6") // 매주 금요일 3시마다
//	@Scheduled(cron="0 4 * * * *") // 테스트용
	public void updateEveryFri() {
		// 배송주기 '1'인 사람 중 배송중인 사람 '배송완'으로 update
		int updateEveryFri = service.updateEveryFri();
		logger.info("배송완");
	}
	
	
	
	
	// 격주
	@Scheduled(cron="0 0 9 * * 4#2,4#4") // 둘째 넷째 수요일 9시마다
//	@Scheduled(cron="0 5 * * * *") // 테스트용
	public void updateBiweekly() {
		List<Delivery> biList = service.selectbiList();
		logger.info("2배송중");

	}
	

	@Scheduled(cron="0 0 15 * * 6#2,6#4") // 둘째 넷째 금요일 3시마다
//	@Scheduled(cron="0 6 * * * *") // 테스트용
	public void updateBiFri() {
		// 배송주기 '2'인 사람 중 배송중인 사람 '배송완'으로 update
		int updateBiFri = service.updateBiFri(); 
		logger.info("2배송완");

	}
	

}
