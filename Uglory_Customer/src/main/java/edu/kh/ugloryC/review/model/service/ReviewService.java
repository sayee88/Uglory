package edu.kh.ugloryC.review.model.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import edu.kh.ugloryC.member.model.vo.Member;
import edu.kh.ugloryC.review.model.vo.ReviewDetail;
import edu.kh.ugloryC.review.model.vo.ReviewSelectInfo;
import edu.kh.ugloryC.review.model.vo.ReviewWrite;
import edu.kh.ugloryC.review.model.vo.UnWrittenProduct;
import edu.kh.ugloryC.review.model.vo.UnWrittenSubscription;

public interface ReviewService {

	
	
	/**
	 * 리뷰 + 이미지 삽입 서비스
	 * @param reviewWrite
	 * @param imageList
	 * @param webPath
	 * @param folderPath
	 * @return result
	 * @throws IOException
	 */
	int insertReview(ReviewWrite reviewWrite, List<MultipartFile> imageList, int reviewStar, String folderPath, String webPath) throws IOException;

	
	
//	int statusUpdate(int subOrderCode);
	
	/**
	 * 구독상품 미작성 리뷰 조회 서비스
	 * @return subUnWrittenList
	 */
	List<UnWrittenSubscription> subUnWrittenList(Member loginMember);


	/**
	 * 개별상품 미작성 리뷰 조회 서비스
	 * @param loginMember
	 * @return productUnWrittenList
	 */
	List<UnWrittenProduct> productUnWrittenList(Member loginMember);



	/**
	 * 리뷰 작성의 상품 조회
	 * @param map
	 * @return unWrittenProduct
	 */
	UnWrittenProduct productSelect(Map<String, Object> map);



	/**
	 * 리뷰 작성의 구독 조회
	 * @param map
	 * @return UnWrittenSubscription
	 */
	UnWrittenSubscription subSelect(Map<String, Object> map);



	/**
	 * 리뷰 전체 후기 수 조회 서비스
	 * @return result1
	 */
	int selectReviewAllCount();



	/**
	 * 별점 평균 조회 서비스
	 * @return result2
	 */
	double selectAvgStar(int memberNo);



	/**
	 * 나의 리뷰 수 조회 서비스
	 * @param memberNo
	 * @return result3
	 */
	int selectMyReviewCount(int memberNo);



	/**
	 * 나의 미작성 리뷰 수 조회 서비스
	 * @param memberNo
	 * @return result4
	 */
	int selectUnWrittenCount(int memberNo);



	/**
	 * 리뷰 구독 리스트 조회 서비스
	 * @return subList
	 */
	List<ReviewSelectInfo> selectSub();



	/**
	 * 리뷰 상품 리스트 조회 서비스
	 * @return 
	 */
	List<ReviewSelectInfo> selectProduct();



	/**
	 * 리뷰 전체 조회 서비스
	 * @return 
	 */
	List<ReviewSelectInfo> allRevieList();



	
	/**
	 * 나의 리뷰 목록 조회 서비스
	 * @param memberNo
	 * @return 
	 */
	List<ReviewSelectInfo> selectMyReview(int memberNo);



	/**
	 * 리뷰 상세 조회
	 * @param reviewNo 
	 * @return reviewDetail
	 */
	List<ReviewDetail> selectReviewDetail(int reviewNo);


	
	

	
	
	
	
	
	

}
