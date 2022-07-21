package edu.kh.ugloryA.review.model.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.ugloryA.review.model.dao.ReviewDAO;
import edu.kh.ugloryA.review.model.vo.Review;
import edu.kh.ugloryA.review.model.vo.ReviewDetail;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewDAO dao;
	
	private Logger logger = LoggerFactory.getLogger(ReviewServiceImpl.class);

	// 전체 리뷰 내역 조회
	@Override
	public List<Review> selectAllReview() {
		return dao.selectAllReview();
	}

	
	// 리뷰 검색 내역 조회
	@Override
	public List<Review> searchReview(String key, String query) {
		return dao.searchReview(key, query);
	}


	// 리뷰 상세 내역 조회
	@Override
	public ReviewDetail selectReviewDetail(int reviewNo) {
		return dao.selectReviewDetail(reviewNo);
	}


	// 리뷰 삭제
	@Override
	public int deleteReview(int reviewNo) {
		return dao.deleteReview(reviewNo);
	}


	// 리뷰 수 조회
	@Override
	public int countReview() {
		return dao.countReview();
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
