package edu.kh.ugloryC.product.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;

import edu.kh.ugloryC.member.model.vo.Member;
import edu.kh.ugloryC.product.model.service.OptionService;
import edu.kh.ugloryC.product.model.service.ProductService;
import edu.kh.ugloryC.product.model.vo.OptionType;
import edu.kh.ugloryC.product.model.vo.ProductDetail;
import edu.kh.ugloryC.product.model.vo.ProductOrder;


@Controller
@RequestMapping("/product")
@SessionAttributes({"loginMember"})
public class ProductController {
	
	@Autowired
	private ProductService service;
	
	@Autowired
	private OptionService optionService;
	
	Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	// 상품 상세 조회
	@GetMapping("/detail/{categoryNo}/{productCode}")
	public String productDetail(@PathVariable("categoryNo") int categoryNo,
							    @PathVariable("productCode") int productCode,
							    Model model) {
							
		ProductDetail detail = service.productDetail(productCode);
	
		// 상품에 따른 옵션 조회
		if(detail != null) { // 상세 조회 성공 시
			List<OptionType> optionList = optionService.selectOptionList(productCode);
			model.addAttribute("optionList", optionList);
		}
		
		// 별점 카운트, 리뷰 카운트 필요
		model.addAttribute("detail", detail);
		
		return "product/productDetail";
	}	
	
	
// - js로 구현
//	// 선택한 옵션 조회
//	@ResponseBody
//	@PostMapping("/detail/optionSelect")
//	public String optionSelect(int optionCode) {
//		
//		List<OptionType> optionList = optionService.selectOption(optionCode);
//		
//		return new Gson().toJson(optionList);
//	}
//	
//	// 옵션 선택에 따른 총 가격 조회
//	@ResponseBody
//	@PostMapping("/detail/optionTotal")
//	public int optionTotal(int productCode,
//							   int optionCode,
//							   @RequestParam Map<String, Object> paramMap) {
//		
//		paramMap.put("productCode", productCode);
//		paramMap.put("optionCode", optionCode);
//		
//		int result = service.totalAmount(paramMap);
//		
//		return result;
//	}
	
	// 결제 페이지 화면 전환
	@SuppressWarnings({ "unchecked" }) // 무점검 경고 억제 어노테이션
	@GetMapping("/order")
	public String productOrder(int productCode,
							   Integer totalAmount, String optionObj, Model model) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		// 넘어온 스트링을 객체 형태로 변환
		map = (Map<String, Object>)new Gson().fromJson(optionObj, map.getClass());
		
		//List<String> lm =  map.keySet().stream().collect(Collectors.toList());
		// java.util.ConcurrentModificationException
		// map을 List로 변환

//		for(String key : lm) {
//			map.put("key" , ((Double)map.get(key)).intValue() );
//		}
		
		
		// 옵션코드 리스트
		List<String> optionCodeList = new ArrayList<String>(map.keySet());

		// 수량 리스트
		List<Integer> amountList = new ArrayList<Integer>();
		for(String key : map.keySet()) {
			amountList.add( ((Double)map.get(key)).intValue() );
		}

		// 	옵션코드 리스트 인덱스 == 수량 리스트 인덱스
				
		map.clear();
		
		map.put("optionCodeList", optionCodeList);
		map.put("amountList", amountList);
		
		map.put("productCode", productCode);
		
		// 주문 페이지 내 옵션 코드 상품 코드에 따른 옵션이름, 개수 조회
		List<OptionType> selectOptionList = service.orderOptionSelect(map);
		
		map.put("selectOptionList", selectOptionList);
		map.put("totalAmount", totalAmount);

		model.addAttribute("map", map);
		
		return "product/productOrder";
	}
	
	// 배송정보 입력
	@PostMapping("/order")
	public String productOrder(@RequestParam(value="p-orderName") String inputName,
							   @RequestParam(value="p-orderPhone") String inputPhone,
							   @RequestParam(value="p-orderAddress") String[] inputAddress,
							   @RequestParam(value="p-orderReq" , required=false) String inputDelText,
							   int totalAmount,
							   @ModelAttribute("loginMember") Member loginMember,
							   String[] orderAddress,
							   RedirectAttributes ra, HttpServletRequest req) {
		
		// 로그인한 회원 번호 얻어와서 pOrder에 세팅
		
		int memberNo = loginMember.getMemberNo();
		
		Map<String, Object> productOrder = new HashMap<String, Object>();
		
		String address = String.join(",,", inputAddress);
		
		//pOrder.setProductOrderAddr(String.join(",,", orderAddress));
		
		if(inputDelText.equals("")) {
			inputDelText = "NULL";
		}
		
		productOrder.put("inputName", inputName);
		productOrder.put("inputPhone", inputPhone);
		productOrder.put("inputAddress", address);
		productOrder.put("totalAmount", totalAmount);
		productOrder.put("inputDelText", inputDelText);
		productOrder.put("memberNo", memberNo);

		int result = service.productOrder(productOrder);

		String message = null;
		String path = null;
		
		if(result > 0) { // 주문 정보 입력 성공
			path = "../member/myPage";
			
		} else {
			message = "배송지 정보 입력 실패";
			path = "product/order";
		}
		
		ra.addFlashAttribute("message", message);
		
		return "redirect:" + path;
	}
	
}
