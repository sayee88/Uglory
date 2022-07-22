package edu.kh.ugloryC.review.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import edu.kh.ugloryC.member.model.vo.Member;
import edu.kh.ugloryC.review.model.vo.ReviewImage;
import edu.kh.ugloryC.review.model.vo.ReviewSelectInfo;
import edu.kh.ugloryC.review.model.vo.ReviewWrite;
import edu.kh.ugloryC.review.model.vo.UnWrittenProduct;
import edu.kh.ugloryC.review.model.vo.UnWrittenSubscription;

@Repository
public class ReviewDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	/**
	 * 리뷰글 삽입 DAO
	 * @param reviewMap
	 * @param reviewNo 
	 * @return reviewNo
	 */
	public int insertReview(Map<String, Object> reviewMap) {
		
		int result = sqlSession.insert("reviewMapper.insertReview", reviewMap);
		
//		List<String> reviewList = new ArrayList<String>(reviewMap.keySet());
		
		ReviewWrite reviewWrite = (ReviewWrite)reviewMap.get("reviewWrite");
		
		if(result > 0) result = reviewWrite.getReviewNo();
		
		return result;
	}


	/**
	 * 리뷰 이미지 삽입 DAO
	 * @param reviewImageList
	 * @return imageResult
	 */
	public int insertReviewImage(List<ReviewImage> reviewImageList) {
		
		int imageResult = sqlSession.insert("reviewMapper.insertReviewImage", reviewImageList);
		
		return imageResult;
	}


	/**
	 * 구독상품 미작성 리뷰 조회 DAO
	 * @return subUnWrittenList
	 */
	public List<UnWrittenSubscription> subUnWrittenList(Member loginMember) {
		
		List<UnWrittenSubscription> subUnWrittenList = sqlSession.selectList("reviewMapper.subUnWrittenList", loginMember);
		
		return subUnWrittenList;
	}


	
	/**
	 * 개별상품 미작성 리뷰 조회 DAO
	 * @param loginMember
	 * @return productUnWrittenList
	 */
	public List<UnWrittenProduct> productUnWrittenList(Member loginMember) {
		
		List<UnWrittenProduct> productUnWrittenList = sqlSession.selectList("reviewMapper.productUnWrittenList", loginMember);
		
		return productUnWrittenList;
	}


	// 구독 리뷰 상태 'Y'
	public int updateSubReviewST(ReviewWrite reviewWrite) {
		
		int subRSTUpdate = sqlSession.update("reviewMapper.updateSubReviewST", reviewWrite);
		
		return subRSTUpdate;
	}


	// 상품 리뷰 상태 'Y'
	public int updateProductReviewST(ReviewWrite reviewWrite) {
		
		int productRSTUpdate = sqlSession.update("reviewMapper.updateProductReviewST", reviewWrite);
		
		return productRSTUpdate;
	}


	
	/**
	 * 리뷰 작성 시 상품 정보 조회
	 * @param map
	 * @return unWrittenProduct
	 */
	public UnWrittenProduct productSelect(Map<String, Object> map) {
		
		
		
		return sqlSession.selectOne("reviewMapper.productSelect" , map);
	}


	
	/**
	 * 리뷰 작성 시 구독 정보 조회
	 * @param map
	 * @return UnWrittenSubscription
	 */
	public UnWrittenSubscription subSelect(Map<String, Object> map) {
		
		return sqlSession.selectOne("reviewMapper.subSelect", map);
	}


	
	

}
