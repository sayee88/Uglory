package edu.kh.ugloryC.review.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import edu.kh.ugloryC.review.model.vo.ReviewWrite;

@Repository
public class ReviewDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	/**
	 * 리뷰글 삽입 DAO
	 * @param reviewWrite
	 * @return result
	 */
	public int insertReview(ReviewWrite reviewWrite) {
		
		int result = sqlSession.insert("reviewMapper.insertReview", reviewWrite);
		
		return 0;
	}

}
