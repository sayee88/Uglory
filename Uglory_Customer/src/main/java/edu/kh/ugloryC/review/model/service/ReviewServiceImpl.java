package edu.kh.ugloryC.review.model.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import edu.kh.ugloryC.common.Util;
import edu.kh.ugloryC.member.model.vo.Member;
import edu.kh.ugloryC.review.exception.InsertFailException;
import edu.kh.ugloryC.review.model.dao.ReviewDAO;
import edu.kh.ugloryC.review.model.vo.ReviewImage;
import edu.kh.ugloryC.review.model.vo.ReviewSelectInfo;
import edu.kh.ugloryC.review.model.vo.ReviewWrite;
import edu.kh.ugloryC.review.model.vo.UnWrittenProduct;
import edu.kh.ugloryC.review.model.vo.UnWrittenSubscription;

@Service
public class ReviewServiceImpl implements ReviewService{
	
	@Autowired
	private ReviewDAO dao;

	// 리뷰 + 이미지 삽입 서비스 구현
	
	// Spring 에서 트랜잭션 처리하는 방법
	// insert update 많이 진행되는 코드에 작성 
	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int insertReview(ReviewWrite reviewWrite, List<MultipartFile> imageList, int reviewStar, String webPath, String folderPath) throws IOException {
		
		// 1. 리뷰 삽입
		
		// 1) XSS 방지 처리 + 개행문자 처리
		reviewWrite.setReviewContent(Util.XSSHandling(reviewWrite.getReviewContent()));
		reviewWrite.setReviewContent(Util.newLineHandling(reviewWrite.getReviewContent()));
		
		// reviewWrite VO, reviewStar 담기 위한 Map 
		Map<String, Object> reviewMap = new HashMap<String, Object>();
		reviewMap.put("reviewWrite", reviewWrite);
		reviewMap.put("starRating", reviewStar);
		
		// 2) 리뷰글 삽입 DAO로 호출
		int reviewNo = dao.insertReview(reviewMap);
		
		if(reviewNo > 0) {
			
			// 이미지를 삽입
			// imageList : 파일 담겨있는 list
			// reviewImageList : DB에 삽입할 이미지만 담겨있는
			// reNameList : 변경된 파일명 담겨있는 list
			
			List<ReviewImage> reviewImageList = new ArrayList<ReviewImage>();
			List<String> reNameList = new ArrayList<String>();
			
			// imageList에 담겨있는 파일 정보 중 실제 업로드된 파일만 분류
			for(int i = 0; i < imageList.size(); i++) {
				
				if(imageList.get(i).getSize() > 0){
					
					// 변경된 파일명으로 저장
					String reName = Util.fileRename(imageList.get(i).getOriginalFilename());
					reNameList.add(reName);
					
					// reviewImage 객체를 생성 값 세팅 후 reviewImageList 추가
					ReviewImage img = new ReviewImage();
					img.setReviewNo(reviewNo);
					img.setReviewImageLevel(i);
					img.setReviewImageOriginal(imageList.get(i).getOriginalFilename());
					img.setReviewImageReName(webPath + reName);
					
					reviewImageList.add(img);
				}
						
			}
			
			// 파일이 업로드 되면 DB 저장
			if(!reviewImageList.isEmpty()) {
				
				int imageResult = dao.insertReviewImage(reviewImageList);
				
				if(imageResult == reviewImageList.size()) { // 삽입 
					
					// 서버에 이미지 여러개 저장
					for(int i = 0; i<reviewImageList.size(); i++) {
						
						int index = reviewImageList.get(i).getReviewImageLevel();
						
						imageList.get(index).transferTo(new File(folderPath + reNameList.get(i)));
						
					}
					
				} else {
					
					throw new InsertFailException();
				}
			}
			
			// 변수로 등록해줌
			String subOrderCode = reviewWrite.getSubOrderCode();
			
			if( subOrderCode != null ) {
				int subRSTUpdate = dao.updateSubReviewST(reviewWrite);
				
			} else {
				int productRSTUpdate = dao.updateProductReviewST(reviewWrite);
				
			}
			
		}
		
		return reviewNo;
		
	}

	
	
	// 구독상품 미작성 리뷰 조회 서비스 구현
	@Override
	public List<UnWrittenSubscription> subUnWrittenList(Member loginMember) {
		
		List<UnWrittenSubscription> subUnWrittenList = dao.subUnWrittenList(loginMember);
		
		return subUnWrittenList;
	}



	// 개별상품 미작성 리뷰 조회 서비스 구현
	@Override
	public List<UnWrittenProduct> productUnWrittenList(Member loginMember) {
		
		List<UnWrittenProduct> productUnWrittenList = dao.productUnWrittenList(loginMember);
		
		return productUnWrittenList;
	}



	// 리뷰 작성 시 상품 정보 조회
	@Override
	public UnWrittenProduct productSelect(Map<String, Object> map) {
		UnWrittenProduct unWrittenProduct = dao.productSelect(map);
		
		List<Map<String, Object>> optionList = dao.productOptionList(map);
		unWrittenProduct.setOptionList(optionList);
		
		return unWrittenProduct;
	}



	// 리뷰 작성 시 구독 정보 조회
	@Override
	public UnWrittenSubscription subSelect(Map<String, Object> map) {
		
		return dao.subSelect(map);
	}



	// 리뷰 전체 후기 수 조회 서비스 구현
	@Override
	public int selectReviewAllCount() {
		
		return dao.selectReviewAllCount();
	}



	// 별점 평균 조회 서비스 구현
	@Override
	public double selectAvgStar() {
		
		return dao.selectAvgStar();
	}



	// 나의 리뷰 수 조회 서비스 구현
	@Override
	public int selectMyReviewCount(int memberNo) {
		
		return dao.selectMyReviewCount(memberNo);
	}



	// 나의 미작성 리뷰 수 조회 서비스 구현
	@Override
	public int selectUnWrittenCount(int memberNo) {
		
		return dao.selectUnWrittenCount(memberNo);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	

	

	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
