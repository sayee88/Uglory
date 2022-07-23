package edu.kh.ugloryC.review.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.ugloryC.member.model.vo.Member;
import edu.kh.ugloryC.review.model.service.ReviewService;
import edu.kh.ugloryC.review.model.vo.ReviewWrite;
import edu.kh.ugloryC.review.model.vo.UnWrittenProduct;
import edu.kh.ugloryC.review.model.vo.UnWrittenSubscription;
import edu.kh.ugloryC.review.model.vo.ReviewSelectInfo;

@Controller
@RequestMapping("/review")
@SessionAttributes({"loginMember"})
public class ReviewController {
	
	@Autowired
	private ReviewService service;

	
	// 이용 약관
	@GetMapping("/termsAndCondition")
	public String termsAndCondition() {
		return "review/termsAndCondition";
	}
	
	
	// 리뷰 후기 list 화면 전환 // 조회할 때 필요한 정보를 담아서
	@GetMapping("/list")
	public String reviewList(Model model, 
			@ModelAttribute("loginMember") Member loginMember){
		
		// 리뷰 박스
		// 리뷰 전체 후기 수 조회
		int result1 = service.selectReviewAllCount();
		
		// 별점 평균 조회
		double result2 = service.selectAvgStar();
		
		// 나의 리뷰 수 조회
												// Member 객체를 가져오기위한 loginMember 변수명에서 memberNo를 꺼내 호출
		int result3 = service.selectMyReviewCount(loginMember.getMemberNo());
		
		// 나의 미작성 리뷰 수 조회
		int result4 = service.selectUnWrittenCount(loginMember.getMemberNo());
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result1", result1);
		map.put("result2", result2);
		map.put("result3", result3);
		map.put("result4", result4);
		
		model.addAttribute("map", map);
		
		return "review/ReviewList";
	}
	
	
	@PostMapping("/list")
	public String reviewList(Member loginMember, ReviewSelectInfo reviewCode) {
		
		
		
		return null;
	}
	
	
	
	// 나의 리뷰 화면 전환
	@GetMapping("/list/myReview")
	public String myReview(Model model, 
			@ModelAttribute("loginMember") Member loginMember){
		
		// 리뷰 박스
		// 리뷰 전체 후기 수 조회
		int result1 = service.selectReviewAllCount();
		
		// 별점 평균 조회
		double result2 = service.selectAvgStar();
		
		// 나의 리뷰 수 조회
												// Member 객체를 가져오기위한 loginMember 변수명에서 memberNo를 꺼내 호출
		int result3 = service.selectMyReviewCount(loginMember.getMemberNo());
		
		// 나의 미작성 리뷰 수 조회
		int result4 = service.selectUnWrittenCount(loginMember.getMemberNo());
		
		Map<String, Object> mybox = new HashMap<String, Object>();
		mybox.put("result1", result1);
		mybox.put("result2", result2);
		mybox.put("result3", result3);
		mybox.put("result4", result4);
		
		model.addAttribute("mybox", mybox);
		
		return "review/MyReview";
	}
	
	
	
	
	
	
	// 미작성 리뷰 호출
	@GetMapping("/list/unWritten")
	public String unWritten(@ModelAttribute("loginMember")  Member loginMember, Model model){
		
		
		// 리뷰 박스
		// 리뷰 전체 후기 수 조회
		int result1 = service.selectReviewAllCount();
		
		// 별점 평균 조회
		double result2 = service.selectAvgStar();
		
		// 나의 리뷰 수 조회
												// Member 객체를 가져오기위한 loginMember 변수명에서 memberNo를 꺼내 호출
		int result3 = service.selectMyReviewCount(loginMember.getMemberNo());
		
		// 나의 미작성 리뷰 수 조회
		int result4 = service.selectUnWrittenCount(loginMember.getMemberNo());
		
		
		// 구독상품에 대한 미작성 리뷰 조회 
		List<UnWrittenSubscription> subUnWrittenList = service.subUnWrittenList(loginMember);
		
		// 개별상품에 대한 미작성 리뷰 조회
		List<UnWrittenProduct> productUnWrittenList = service.productUnWrittenList(loginMember);
		
		// map 에 담기
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("subUnWrittenList", subUnWrittenList);
		map.put("productUnWrittenList", productUnWrittenList);
		map.put("result1", result1);
		map.put("result2", result2);
		map.put("result3", result3);
		map.put("result4", result4);
		
		model.addAttribute("map", map);
		
		
		return "review/UnWrittenReview";
	}
	
	
	
	
	
	
	
	
	// 리뷰 작성 화면 전환
	@GetMapping("/write/{orderCode}")
	public String write( @PathVariable("orderCode") String orderCode,
			int reviewCode,
			@RequestParam(value="productCode", required = false, defaultValue = "0") int productCode,
			@ModelAttribute("loginMember")  Member loginMember, Model model, String mode) {
		
		int memberNo = loginMember.getMemberNo();
		// 상품 정보 불러오기
		// 구독 (구독이미지(따로 불러오고), 구독일, 구독상품명, 구독결제금액)
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("orderCode", orderCode);
		
		if(reviewCode == 1) {
			
			// 구독상품 조회
			UnWrittenSubscription UnWrittenSubscription = service.subSelect(map);
			model.addAttribute("UnWrittenSubscription", UnWrittenSubscription);
			
		}else {
			map.put("productCode", productCode);
			// 개별상품 조회
			UnWrittenProduct unWrittenProduct = service.productSelect(map);
			model.addAttribute("unWrittenProduct",unWrittenProduct);
		}
		
		
		return "review/ReviewWriteForm";
	}
	
	// 리뷰 작성
	@PostMapping("/write/{orderCode}")
	public String write(@RequestParam(value="images", required=false) List<MultipartFile> imageList // 업로드 파일(이미지) 리스트
			, @PathVariable("orderCode") String orderCode
			, int reviewCode
			, String mode
			, @ModelAttribute("loginMember") Member loginMember
			, @RequestParam("reviewStar") int reviewStar
			, HttpServletRequest req
			, RedirectAttributes ra
			
			,@RequestParam(value="deleteList", required=false) String deleteList
			,ReviewWrite reviewWrite) throws IOException {
		
		// 로그인한 회원 (모달창에 보이게 해야함)
		// (작성 완료 시 review/list로 이동)
		// reviewSelectInfo 에 세팅
		reviewWrite.setMemberNo(loginMember.getMemberNo());
		
		
		// 이미지 저장 경로 얻어와야해(webPath/ folderPath)
		String webPath = "/resources/img/review/";
		
		// folderPath = webPath까지의 실제 컴퓨터 경로
		String folderPath = req.getSession().getServletContext().getRealPath(webPath);
		
		// 삽입 / 수정 일때 구분
		if(mode.equals("insert")) {
			
			// 리뷰 삽입 할 때
			
			// 회원번호, reviewCode, 별점, 별점 평균, 작성일, 리뷰 내용
			
			// 리뷰에 이미지 정보(0~4) 리뷰 번호도 필요
			// -> 실제 파일로 변환 -> 서버에 저장 ( transFer() )
			
			// insert 한 개라도 실패하면 rollback 
			
			if(reviewCode == 1) reviewWrite.setSubOrderCode(orderCode);
			else 				reviewWrite.setProductOrderCode(orderCode);
			
			
			
			int reviewNo = service.insertReview(reviewWrite ,imageList, reviewStar, webPath, folderPath);
			
			String path = null;
			String message = null;
			
			if(reviewNo > 0) {
				
//				int statusUpdate = service.statusUpdate(reviewWrite.getSubOrderCode());
				path = "../list";
				message = "리뷰 등록 완료!";
				
			} else {
				path = req.getHeader("referer");
				message = "리뷰 등록 실패ㅜㅜ";
			}
			
			ra.addFlashAttribute("message", message);
			return "redirect:" + path;
			
		} else { // 수정일 부분
			
		}
		
		
		return "/review/ReviewList";
	}
	
	
	
	
	
}
