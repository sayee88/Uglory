package edu.kh.ugloryC.review.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import edu.kh.ugloryC.common.Util;
import edu.kh.ugloryC.review.model.dao.ReviewDAO;
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
		
		
		
		return 0;
	}

	
	
	
	
	
	
	
	
	
	
	

}
