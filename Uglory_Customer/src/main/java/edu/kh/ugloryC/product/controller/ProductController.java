package edu.kh.ugloryC.product.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
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
import edu.kh.ugloryC.product.model.vo.ProductCart;
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
		
		// 별점 조회
		double result = service.selectStar(productCode);
		
		// 리뷰 수 조회 
		if(result > 0) {
			int count = service.countReview(productCode);

			model.addAttribute("count", count);
			model.addAttribute("result", result);
			
		}
		
		// 상품 이미지 조회
		List<String> productImgList = service.selectImgList(productCode);
		
		model.addAttribute("productImgList", productImgList);
		
		model.addAttribute("detail", detail);
		
		return "product/productDetail";
	}	
	
	// 결제 페이지 화면 전환
	@SuppressWarnings({ "unchecked" }) // 무점검 경고 억제 어노테이션
	@GetMapping("/order")
	public String productOrder(String productCode,
							   Integer totalAmount, String optionObj, Model model) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		// 넘어온 스트링을 객체 형태로 변환
		map = (Map<String, Object>)new Gson().fromJson(optionObj, map.getClass());
	
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
		
//		// 이미지 조회
		List<String> orderImgList = service.selectImages(productCode);
		
		model.addAttribute("orderImgList", orderImgList);
		
		map.put("selectOptionList", selectOptionList);
		
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
		
		map.put("totalAmount", totalAmount);

		model.addAttribute("map", map);
		
		return "product/productOrder";
	}
	
	// 장바구니 - 결제페이지 
	@GetMapping("/cartOrder")
	public String cartOrder(Integer totalAmount, @RequestParam(value="optionNo", required=false) List<Integer> optionNoList,
							/*@RequestParam(value="productPrice", required=false) List<String> productPrice*/ Model model) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("optionNoList", optionNoList);
		
		List<OptionType> cartList = service.cartOrder(map);
		
		map.put("totalAmount", totalAmount);
		map.put("cartList", cartList);
		
		// 주문 번호 생성
		String pOrderCode = service.createProductOrderCode();
		
		map.put("pOrderCode", pOrderCode);
		
		// 이미지 조회
		List<String> cartOrderImgList = service.cartOrderImage(map);
		model.addAttribute("cartOrderImgList", cartOrderImgList);
		
		if(pOrderCode != null) {
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
			
			String date = sdf.format(new Date());
			
			int random = (int)(Math.random() * 5);
			String productPayNo = date + "-" + random;
			
			map.put("productPayNo", productPayNo);
		}
		
		//model.addAttribute("productPrice", productPrice);
		model.addAttribute("map", map);
		
		return "product/productOrder";
	}
	
	// 배송정보 입력 - 결제
	@SuppressWarnings("unused")
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
							RedirectAttributes ra, HttpServletRequest req,
							@RequestParam(value="optionCodeList") String optionCode, // OPTION_CD 리스트
							@RequestParam(value="amountList") String amount, // OPTION_COUNT 리스트
							@RequestParam(value="optionNoList", required=false) String optionNo // OPTION_NO 리스트 (
							) {
		
		int memberNo = loginMember.getMemberNo();
		
		Map<String, Object> productOrder = new HashMap<String, Object>();
		
		String address1 = pOrderAddress1 + pOrderAddress2;
		
		String address = String.join(",,", address1);
		
		// 옵션 코드 내 [] 를 공백으로 바꿈
		optionCode = optionCode.replaceAll("\\[", "");
		optionCode = optionCode.replaceAll("\\]", "");
		
		// 옵션 수량 내 [] 를 공백으로 바꿈
		amount = amount.replaceAll("\\[", "");
		amount = amount.replaceAll("\\]", "");

		// , 기준으로 잘라서 배열에 저장
		String[] optionCodeArr = optionCode.split(",");
		String[] amountArr = amount.split(",");

		List<String> optionCodeList = Arrays.asList(optionCodeArr);
		List<String> amountList = Arrays.asList(amountArr);

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

		// 상품 디테일 -> 결제 OPTION_TB 테이블 삽입
		if(optionNo.equals("")) {
			int insertOptionTb = service.insertOptionTb(optionCodeList, amountList, pOrderCode);	
			
		} else {
			// 장바구니 -> 결제 OPTION_TB UPDATE 및 CART DELETE
			
			// 옵션 넘버 내 [] 를 공백으로 바꿈
			optionNo = optionNo.replaceAll("\\[", "");
			optionNo = optionNo.replaceAll("\\]", "");
			
			String[] optionNoarr = optionNo.split(",");
			
			List<String> optionNoList = Arrays.asList(optionNoarr);
			
			// 장바구니 -> OPTION_TB 업데이트
			int optionUpdate = service.updateOptionTb(optionNoList, pOrderCode);
			// 장바구니 테이블 삭제
			int deleteCart = service.deleteCart(optionNoList, memberNo);
		}
		
		if(result > 0) { // 주문 정보 입력 및 결제 성공 시 PRODUCT_PAY 테이블 삽입

			int productPay = service.productPay(productOrder);
		}
		
		model.addAttribute("productOrder", productOrder);
		
		return result;
	}
	
	// 장바구니 담기
	@SuppressWarnings({"unchecked"})
	@ResponseBody
	@PostMapping("/cart")
	public int cart(@ModelAttribute("loginMember") Member loginMember,
					   Integer productCode,
					   Integer totalAmount, String cartOption) {
		
		Map<String, Object> cartMap = new HashMap<String, Object>();
		
		int memberNo = loginMember.getMemberNo();
		
		if(productCode != null || totalAmount != null || cartOption != null) {
			
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
			List<Integer> optionNoList = service.insertOptionInfo(optionCodeList, amountList);
			
			Map<String, Object> cartInsertMap = new HashMap<String, Object>();
			
			cartInsertMap.put("optionNoList", optionNoList);
			cartInsertMap.put("memberNo", memberNo);
			
			return service.insertProductCart(cartInsertMap);

		} 
		return 0;
	}
	
	// 장바구니 화면 전환
	@GetMapping("/cart")
	public String selectCart(@ModelAttribute("loginMember") Member loginMember, 
							Model model) {
		
		// 장바구니 상품 조회
		List<ProductCart> productCartList = service.productCart(loginMember.getMemberNo()); 
		
//		List<String> cartImagelist = service.cartImage(loginMember.getMemberNo()); 
		
//		model.addAttribute("cartImagelist", cartImagelist);
		model.addAttribute("productCartList", productCartList);

		return "product/productCart";
	}
	
	// 장바구니에 담은 상품 삭제
	@ResponseBody
	@PostMapping("/cartDelete")
	public int cartDelete(@ModelAttribute("loginMember") Member loginMember,
					      @RequestParam(value="optionNo") String optionNoDelete) {
				
		int memberNo = loginMember.getMemberNo();  
		
		optionNoDelete = optionNoDelete.replaceAll("\\[", "");
		String[] optionNoArr = optionNoDelete.split(",");
		List<String> deleteList = Arrays.asList(optionNoArr);
		
		// x버튼 클릭 시 장바구니 삭제 
		int result = service.cartDelete(memberNo, deleteList);
		
		return result;
	}
	
	// 장바구니 내 옵션 수량 변경 - Minus
	@ResponseBody
	@PostMapping("/cartMinus")
	public int cartMinus(@RequestParam(value="minusOptionNo") String minusOptionNo,
						@RequestParam(value="optionMinusCount") String optionMinusCount) {
		
		minusOptionNo = minusOptionNo.replaceAll("\\[", "");
		String[] minusArr = minusOptionNo.split(",");
		List<String> minusOptionList = Arrays.asList(minusArr);
		
		// 수량 마이너스 변경
		int result = service.minusCount(minusOptionList ,optionMinusCount);
		
		return result;
	}
	
	// // 장바구니 내 옵션 수량 변경 - PLUS
	@ResponseBody
	@PostMapping("/cartPlus")
	public int cartPlus(@RequestParam(value="plusOptionNo") String plusOptionNo,
						@RequestParam(value="optionPlusCount") String optionPlusCount) {
		
		plusOptionNo = plusOptionNo.replaceAll("\\[", "");
		String[] plusArr = plusOptionNo.split(",");
		List<String> plusOptionList = Arrays.asList(plusArr);
		
		// 수량 플러스 변경
		int result = service.plusCount(plusOptionList ,optionPlusCount);
		
		return result;
	}
}
