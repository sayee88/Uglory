package edu.kh.ugloryA.common.scheduling;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import edu.kh.ugloryA.product.model.service.ProductService;

@Component
public class WeeklyUpdateScheduling {
	
	private Logger logger = LoggerFactory.getLogger(WeeklyUpdateScheduling.class);
	
	@Autowired
	private ProductService service;

	@Autowired
	private ServletContext application;
	
//	@Scheduled(cron="0 * * * * *")
	@Scheduled(cron="0 0 12 * * 1")
	public void weeklyUpdate() {
		
		logger.info("weekly에서 1분마다 출력");
		
		int count = service.weeklyUpdate();
		
		if(count > 0) {
			logger.info(count + "개의 주별 상품 리스트가 업데이트 되었습니다.");
		} else {
			logger.info("주별 상품 리스트가 존재하지 않습니다.");
		}
		
	}
	
	
}
