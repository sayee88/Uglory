package edu.kh.ugloryA.common.scheduling;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import edu.kh.ugloryA.common.Util;
import edu.kh.ugloryA.product.model.service.ProductService;
import edu.kh.ugloryA.product.model.vo.WeeklyProduct;

@Component
public class WeeklyUpdateScheduling {
	
	private Logger logger = LoggerFactory.getLogger(WeeklyUpdateScheduling.class);
	
	@Autowired
	private ProductService service;

//	@Scheduled(cron="0 * * * * *")
//	@Scheduled(cron="0 0 14 * * 0")
	public void weeklyUpdate() {
		
		//logger.info("weekly에서 1분마다 출력");
		
		int count = service.weeklyUpdate();
		
		if(count > 0) {
			logger.info(count + "개의 주별 상품 리스트가 업데이트 되었습니다.");
		} else {
			logger.info("주별 상품 리스트가 존재하지 않습니다.");
		}
		
		//text 만들기
		String text = "[Uglory 배송 상품 목록]\n";
		
		List<WeeklyProduct> deliveryList = service.selectThisWeek();
		
		String delivery = "";
		
		for(WeeklyProduct del : deliveryList) {
			delivery += "- " + del.getProductName() + " " + del.getOptionName() + "\n";
		}
		
		text += delivery + "\n* 표시된 상품 수량(용량)은 Standard 상품 기준입니다.";
				
		//phone 조회해오기
		List<String> phoneList = service.selectPhoneList();
		String memberPhone = String.join(", ", phoneList);
		
		if(!phoneList.isEmpty()) {
			Util.sendMessage(text, memberPhone);
		}
	}
	
}
