package edu.kh.ugloryA.review.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.ugloryA.review.model.dao.ReviewDAO;
import edu.kh.ugloryA.review.model.vo.Pagination;
import edu.kh.ugloryA.review.model.vo.Review;
import edu.kh.ugloryA.review.model.vo.ReviewDetail;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewDAO dao;
	
	private Logger logger = LoggerFactory.getLogger(ReviewServiceImpl.class);

	// 전체 리뷰 내역 조회
	@Override
	public Map<String, Object> selectAllReview(int cp) {
		
		int listCount = dao.countReview();
		Pagination pagination = new Pagination(cp, listCount);
		
		List<Review> reviewList = dao.selectAllReview(pagination);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("pagination", pagination);
		map.put("reviewList", reviewList);

		return map;
	}

	
	// 리뷰 검색 내역 조회
	@Override
	public Map<String, Object> searchReview(int cp, String key, String query) {
		
		int listCount = dao.searchListCount(key, query);
		
		Pagination pagination = new Pagination(cp, listCount);
		
		List<Review> reviewList = dao.searchReview(key, query, pagination);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("pagination", pagination);
		map.put("reviewList", reviewList);
		
		
		return map;
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
