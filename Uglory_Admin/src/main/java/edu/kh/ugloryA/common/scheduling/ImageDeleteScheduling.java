package edu.kh.ugloryA.common.scheduling;

import java.io.File;
import java.util.Arrays;
import java.util.List;

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
	
	@Scheduled(cron="0 0 0 * * *")
	public void serverImageDelete() {
		
		//사용하지 않는 상품이미지 삭제
		List<String> dbList = service.selectProductDBList();
		
		String folderPath = application.getRealPath("/resources/img/productImage");
		
		File path = new File(folderPath);
		File[] arr = path.listFiles();
		
		//배열을 List로 바꾸기
		List<File> serverList = Arrays.asList(arr);
		
		if(!serverList.isEmpty()) {
			
			for(File serverImage : serverList) {
				
				String name = serverImage.getName();
				
				if(dbList.indexOf(name) == -1) {
					
					//dbList에는 없는데 serverList에만 파일이 존재하는 경우
					logger.info(serverImage.getName() + "삭제");
					serverImage.delete();
				}
			}
			logger.info("---------- 서버 이미지 삭제 완료 ----------");
		}
	}
}
