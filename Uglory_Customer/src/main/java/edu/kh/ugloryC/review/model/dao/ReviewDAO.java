package edu.kh.ugloryC.review.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import edu.kh.ugloryC.member.model.vo.Member;
import edu.kh.ugloryC.review.model.vo.ReviewDetail;
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


	
	/**
	 * 리뷰 전체 후기 수 조회 DAO
	 * @return result1
	 */
	public int selectReviewAllCount() {
		
		return sqlSession.selectOne("reviewMapper.selectReviewAllCount");
	}


	/**
	 * 별점 평균 조회 DAO
	 * @return result2
	 */
	public double selectAvgStar(int memberNo) {
		
		return sqlSession.selectOne("reviewMapper.selectAvgStar", memberNo);
	}


	
	/**
	 * 나의 리뷰 수 조회 DAO
	 * @param memberNo
	 * @return result3
	 */
	public int selectMyReviewCount(int memberNo) {
		
		return sqlSession.selectOne("reviewMapper.selectMyReviewCount", memberNo);
	}


	/**
	 * 나의 미작성 리뷰 수 조회 DAO
	 * @param memberNo
	 * @return result4
	 */
	public int selectUnWrittenCount(int memberNo) {
		
		return sqlSession.selectOne("reviewMapper.selectUnWrittenCount", memberNo);
	}


	/**
	 * 옵션 따로...
	 * @param map
	 * @return
	 */
	public List<Map<String, Object>> productOptionList(Map<String, Object> map) {
		return sqlSession.selectList("reviewMapper.productOptionList", map);
	}


	
	
	/**
	 * 리뷰 구독 전체 리스트 조회 DAO
	 * @return
	 */
	public List<ReviewSelectInfo> selecSub() {
		
		return sqlSession.selectList("reviewMapper.selecSub");
	}


	
	/**
	 * 리뷰 상품 전체 리스트 조회 DAO
	 * @return
	 */
	public List<ReviewSelectInfo> selectProduct() {
		
		return sqlSession.selectList("reviewMapper.selectProduct");
	}


	
	/**
	 * 리뷰 전체 조회 DAO
	 * @return
	 */
	public List<ReviewSelectInfo> allRevieList() {
		
		return sqlSession.selectList("reviewMapper.allRevieList");
	}


	
	/**
	 * 나의 리뷰 목록 조회 DAO
	 * @param memberNo
	 * @return
	 */
	public List<ReviewSelectInfo> selectMyReview(int memberNo) {
		
		return sqlSession.selectList("reviewMapper.selectMyReview", memberNo);
	}


	
	/**
	 * 리뷰 상세 조회
	 * @param reviewNo 
	 * @return reviewDetail
	 */
	public List<ReviewDetail> selectReviewDetail(int reviewNo) {
		
		return sqlSession.selectList("reviewMapper.selectReviewDetail", reviewNo);
	}


	

	/**
	 * 리뷰 삭제
	 * @param map
	 * @return result
	 */
	public int reviewDelete(Map<String, Object> map) {
		
		return sqlSession.update("reviewMapper.reviewDelete", map);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	


	
	

}
