package edu.kh.ugloryC.review.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import edu.kh.ugloryC.common.Util;
import edu.kh.ugloryC.review.model.dao.ReviewDAO;
import edu.kh.ugloryC.review.model.vo.ReviewImage;
import edu.kh.ugloryC.review.model.vo.ReviewWrite;

@Service
public class ReviewServiceImpl implements ReviewService{
	
	@Autowired
	private ReviewDAO dao;

	// 리뷰 + 이미지 삽입 서비스 구현
	@Override
	public int insertReview(ReviewWrite reviewWrite, List<MultipartFile> imageList, String webPath, String folderPath) {
		
		// 1. 리뷰 삽입
		
		// 1) XSS 방지 처리 + 개행문자 처리
		reviewWrite.setReviewContent(Util.XSSHandling(reviewWrite.getReviewContent()));
		reviewWrite.setReviewContent(Util.newLineHandling(reviewWrite.getReviewContent()));
		
		// 2) 리뷰글 삽입 DAO로 호출
		int result = dao.insertReview(reviewWrite);
		
		if(result > 0) {
			
			// 이미지를 삽입
			// imageList : 파일 담겨있는 list
			// reviewImageList : DB에 삽입할 이미지만 담겨있는
			// reNameList : 변경된 파일명 담겨있는 list
			
			List<ReviewImage> reviewImageList = new ArrayList<ReviewImage>();
			List<String> reNameList = new ArrayList<String>();
			
			// imageList에 담겨있는 파일 정보 중 실제 업로드된 파일만 분류
			for(int i = 0; i < imageList.size(); i++) {
				
				if(imageList.get(i).getSize() > 0){
					
					// 변경된 파일명으로 저장
					String reName = Util.fileRename(imageList.get(i).getOriginalFilename());
					reNameList.add(reName);
					
					// reviewImage 객체를 생성 값 세팅 후 reviewImageList 추가
					ReviewImage img = new ReviewImage();
					img.setReviewNo(result);
					img.setReviewImageLevel(i);
					img.setReviewImageOriginal(imageList.get(i).getOriginalFilename());
					img.setReviewImageReName(webPath + reName);
					
					reviewImageList.add(img);
				}
				
			}
			
			// 파일이 업로드 되면 DB 저장
			if(!reviewImageList.isEmpty()) {
				
				int imageResult = dao.insertReviewImage(reviewImageList);
				
				if(imageResult == reviewImageList.size()) {
					
					
				} else {
					
				}
				
				
			} else {
				
			}
			
			
			
			
			
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		return result;
	}

	
	
	
	
	
	
	
	
	
	
	

}
