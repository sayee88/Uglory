package edu.kh.ugloryC.common.scheduling;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import edu.kh.ugloryC.subscription.model.service.SubscriptionService;

import java.util.List;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Component
public class DeliveryUpdateScheduling {
	
	private Logger logger = LoggerFactory.getLogger(DeliveryUpdateScheduling.class);
	
	@Autowired
	private SubscriptionService service;
	
	
	@Scheduled(cron="0 0 15 * * 4") // 수요일 3시마다
	public void updateEvery() {
		
		List<String> everyList = service.selectEveryList();
		
	}
	

}
