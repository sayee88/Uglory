package edu.kh.ugloryC.review.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
import edu.kh.ugloryC.review.model.vo.Review;

@Controller
@RequestMapping("/review")
@SessionAttributes("loginMember")
public class ReviewController {
	
	@Autowired
	private ReviewService service;

	
	// 이용 약관
	@GetMapping("/termsAndCondition")
	public String termsAndCondition() {
		return "review/termsAndCondition";
	}
	
	
	// 리뷰 후기
	@GetMapping("/list")
	public String review(){
		
		return "review/Review";
	}
	
	
	// 리뷰 작성 화면 전환
	@GetMapping("/write/{reviewCode}")
	public String write( @PathVariable("reviewCode") int reviewCode ) {
		
		return "review/ReviewWriteForm";
	}
	
	// 리뷰 작성
	@PostMapping("/write/{reviewCode}")
	public String write(@RequestParam(value="images", required=false) List<MultipartFile> imageList // 업로드 파일(이미지) 리스트
			, @PathVariable("reviewCode") int reviewCode
			, String mode
			, @ModelAttribute("loginMember") Member loginMember
			, HttpServletRequest req
			, RedirectAttributes ra
			
			,@RequestParam(value="deleteList", required=false) String deleteList
			,Review review) {
		
		// 로그인한 회원 (모달창에 보이게 해야함)
		// (작성 완료 시 review/list로 이동)
		
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
			
			
		} else {
			
		}
		
		return "";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
