package edu.kh.ugloryC.review.model.service;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import edu.kh.ugloryC.member.model.vo.Member;
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


	
	

	
	
	
	
	
	

}
