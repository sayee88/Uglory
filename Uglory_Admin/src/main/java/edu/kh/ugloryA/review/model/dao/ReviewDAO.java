package edu.kh.ugloryA.review.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.ugloryA.review.model.vo.Review;

@Repository
public class ReviewDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private Logger logger = LoggerFactory.getLogger(ReviewDAO.class);

	
	/**
	 * 전체 리뷰 내역 조회
	 * @return reviewList
	 */
	public List<Review> selectAllReview() {
		return sqlSession.selectList("reviewMapper.selectAllReview");
	}

	
	/**
	 * 리뷰 검색 내역 조회
	 * @return reviewList
	 */
	public List<Review> searchReview(String key, String query) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("key", key);
		map.put("query", query);
		
		return sqlSession.selectList("reviewMapper.searchReview", map);
	}
	
}
