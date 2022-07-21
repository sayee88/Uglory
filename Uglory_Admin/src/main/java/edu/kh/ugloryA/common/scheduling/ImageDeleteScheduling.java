package edu.kh.ugloryA.common.scheduling;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import edu.kh.ugloryA.product.model.service.ProductService;

@Component
public class ImageDeleteScheduling {

	private Logger logger = LoggerFactory.getLogger(WeeklyUpdateScheduling.class);
	
	@Autowired
	private ProductService service;

	@Autowired
	private ServletContext application;
	
//	@Scheduled(cron="0 0 0 * * *")
	@Scheduled(cron="0 * * * * *")
	public void serverImageDelete() {
		
		//logger.info("imagedelte에서 1분마다 출력");
		
		//이미지 삭제 추가 예정
		
	}
	
}
