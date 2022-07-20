package edu.kh.ugloryA.review.model.service;

import java.util.List;

import edu.kh.ugloryA.review.model.vo.Review;
import edu.kh.ugloryA.review.model.vo.ReviewDetail;

public interface ReviewService {

	/**
	 * 전체 리뷰 내역 조회
	 * @return reviewList
	 */
	List<Review> selectAllReview();

	
	/**
	 * 리뷰 검색 내역 조회
	 * @param key
	 * @param query
	 * @return reviewList
	 */
	List<Review> searchReview(String key, String query);


	/**
	 * 리뷰 상세 내역 조회
	 * @param reviewNo
	 * @return
	 */
	ReviewDetail selectReviewDetail(int reviewNo);

}
