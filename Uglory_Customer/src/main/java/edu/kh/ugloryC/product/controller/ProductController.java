package edu.kh.ugloryC.product.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;

import edu.kh.ugloryC.member.model.vo.Member;
import edu.kh.ugloryC.product.model.service.OptionService;
import edu.kh.ugloryC.product.model.service.ProductService;
import edu.kh.ugloryC.product.model.vo.OptionType;
import edu.kh.ugloryC.product.model.vo.ProductDetail;


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
	public String productOrder(Integer productCode,
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
		
		// 주문 번호 생성
		String pOrderCode = service.createProductOrderCode();
		
		map.put("pOrderCode", pOrderCode);
		
		if(pOrderCode != null) {
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
			
			String date = sdf.format(new Date());
			
			int random = (int)(Math.random() * 5);
			String productPayNo = date + "-" + random;
			
			map.put("productPayNo", productPayNo);
		}
		
		// 주문 페이지 내 옵션 코드 상품 코드에 따른 옵션이름, 개수 조회
		List<OptionType> selectOptionList = service.orderOptionSelect(map);
		
		map.put("selectOptionList", selectOptionList);
		map.put("totalAmount", totalAmount);

		model.addAttribute("map", map);
		
		return "product/productOrder";
	}
	
	// 배송정보 입력 - 결제
	@ResponseBody
	@PostMapping("/order")
	public int productOrder(@RequestParam(value="pOrderCode", required=false) String pOrderCode,
							@RequestParam(value="pOrderName", required=false) String pOrderName,
							@RequestParam(value="pOrderPhone", required=false) String pOrderPhone,
							@RequestParam(value="pOrderAddress1", required=false) String pOrderAddress1,
							@RequestParam(value="pOrderAddress2", required=false) String pOrderAddress2,
							@RequestParam(value="pOrderReq" , required=false) String pOrderReq,
							@RequestParam(value="productPayNo") String productPayNo,
							int totalAmount,
							@ModelAttribute("loginMember") Member loginMember,
							Model model,
							RedirectAttributes ra, HttpServletRequest req) {
		
		int memberNo = loginMember.getMemberNo();
		
		Map<String, Object> productOrder = new HashMap<String, Object>();
		
		String address1 = pOrderAddress1 + pOrderAddress2;
		
		String address = String.join(",,", address1);
		
		if(pOrderReq.equals("")) {
			pOrderReq = "NULL";
		}
		
		productOrder.put("pOrderCode", pOrderCode);
		productOrder.put("pOrderName", pOrderName);
		productOrder.put("pOrderPhone", pOrderPhone);
		productOrder.put("pOrderAddress", address);
		productOrder.put("totalAmount", totalAmount);
		productOrder.put("pOrderReq", pOrderReq);
		productOrder.put("memberNo", memberNo);
		productOrder.put("productPayNo", productPayNo);

		int result = service.productOrder(productOrder);
		
		if(result > 0) { // 주문 정보 입력 및 결제 성공 시 결제 테이블 삽입
			int productPay = service.productPay(productOrder);
		}
		
		model.addAttribute("productOrder", productOrder);
		
		return result;
	}
	
	// 장바구니 담기
	@SuppressWarnings({"unchecked"})
	@GetMapping("/cart")
	public String cart(Model model, @ModelAttribute("loginMember") Member loginMember,
					   Integer productCode,
					   Integer totalAmount, String cartOption) {
		
		Map<String, Object> cartMap = new HashMap<String, Object>();
		
		int memberNo = loginMember.getMemberNo();
		
		cartMap = (Map<String, Object>)new Gson().fromJson(cartOption, cartMap.getClass());

		// 옵션코드 리스트
		List<String> optionCodeList = new ArrayList<String>(cartMap.keySet());
		
		// 수량 리스트
		List<Integer> amountList = new ArrayList<Integer>();

		for(String key : cartMap.keySet()) {
			amountList.add( ((Double)cartMap.get(key)).intValue() );
		}
		
		cartMap.clear();
		
		cartMap.put("optionCodeList", optionCodeList);
		cartMap.put("amountList", amountList);
		cartMap.put("totalAmount", totalAmount);
		
		// 옵션 tb 삽입
		int insertOptionInfo = service.insertOptionInfo(optionCodeList, amountList);
		
		// 장바구니 테이블 삽입
		if(insertOptionInfo > 0) {
			
			Map<String, Object> cartOptionMap = new HashMap<String, Object>();
			
			cartOptionMap.put("optionCodeList", optionCodeList);
			cartOptionMap.put("amountList", amountList);
			
			List<Integer> selectOptionNo = service.selectOptionNo(cartOptionMap);
					
			cartOptionMap.put("memberNo", memberNo);
			
//			
//			int insertProductCart = service.insertProductCart(loginMember.getMemberNo(), );			
		}
		// 주문 페이지 내 옵션 코드 상품 코드에 따른 옵션이름, 개수 조회
		//List<OptionType> cartOptionList = service.cartOptionList(cartMap);
				
		//cartMap.put("cartOptionList", cartOptionList);
		
		return "product/productCart";
	}
	
//	// 장바구니에 담기 (insert)
//	@GetMapping("/cartInsert")
//	@ResponseBody
//	public Map<String, Object> cart(Model model) {
//	
//		
//		return cartMap;
//	}
	
}
