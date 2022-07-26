package edu.kh.ugloryC.product.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.kh.ugloryC.product.model.dao.ProductDAO;
import edu.kh.ugloryC.product.model.vo.OptionType;
import edu.kh.ugloryC.product.model.vo.ProductCart;
import edu.kh.ugloryC.product.model.vo.ProductDetail;
import edu.kh.ugloryC.product.model.vo.ProductOrder;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductDAO dao;

	// 상품 상세 조회 서비스 구현
	@Override
	public ProductDetail productDetail(int productCode) {
		
		return dao.productDetail(productCode);
	}

	// 상품 상세 페이지 별점 조회
	@Override
	public double selectStar(int productCode) {
		
		return dao.selectStar(productCode);
	}
	
	// 상품 상세 페이지 리뷰 수 조회
	@Override
	public int countReview(int productCode) {
		
		return dao.countReview(productCode);
	}

	// 주문 페이지 내 옵션에 따른 상품, 옵션 조회
	public List<OptionType> orderOptionSelect(Map<String, Object> map) {
		
		return dao.orderOptionSelect(map);
	}

	// 주문 정보 
	@Override
	public int productOrder(Map<String, Object> productOrder) {
		
		return dao.productOrder(productOrder);
	}

	// 상품 주문번호 생성
	@Override
	public String createProductOrderCode() {

		return dao.createProductOrderCode();
	}

	// 결제 정보 삽입
	@Override
	public int productPay(Map<String, Object> productOrder) {
		
		return dao.productPay(productOrder);
	}

	// 장바구니 삽입을 위한 옵션 TB 삽입
	@Transactional(rollbackFor = {Exception.class})
	@Override
	public List<Integer> insertOptionInfo(List<String> optionCodeList, List<Integer> amountList) {
		
		int result = 0;
		
		Map<String, Object> optionMap = new HashMap<String, Object>();
		List<Integer> optionNoList = new ArrayList<Integer>();
		
		for(int i=0; i<optionCodeList.size(); i++) {
			
			optionMap.put("optionCode", optionCodeList.get(i));
			optionMap.put("optionAmout", amountList.get(i));
			
			result = dao.insertOptionInfo(optionMap);
			
			optionNoList.add(result);
		}
		
		return optionNoList;
	}

	// 장바구니 테이블 삽입
	@Override
	public int insertProductCart(Map<String, Object> cartInsertMap) {
		
		return dao.insertProductCart(cartInsertMap);
	}

	// 장바구니 조회
	@Override
	public List<ProductCart> productCart(int memberNo) {

		return dao.productCart(memberNo);
	}

	// 결제 시 OPTION_TB 테이블 삽입
	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int insertOptionTb(List<String> optionCodeList, List<String> amountList, String pOrderCode) {

		int result = 0;
		
		Map<String, Object> optionMap = new HashMap<String, Object>();
		
		optionMap.put("pOrderCode", pOrderCode);
		
		for(int i=0; i<optionCodeList.size(); i++) {
			
			optionMap.put("optionCode", optionCodeList.get(i));
			optionMap.put("optionAmout", amountList.get(i));
			
			result = dao.insertOptionTb(optionMap);
		}
			
		return result;
	}

	// x버튼 클릭 시 장바구니 삭제 
	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int cartDelete(int memberNo, List<String> deleteList) {
		
		int result = 0;
		
		Map<String, Object> optionDeleteMap = new HashMap<String, Object>();
		
		optionDeleteMap.put("memberNo", memberNo);
		
		for(int i=0; i<deleteList.size(); i++) {
			optionDeleteMap.put("optionNoDelete", deleteList.get(i));
			
			result = dao.cartDelete(optionDeleteMap);
		}
		
		return result;
	}

	// 장바구니 내 옵션 수량 변경 - Minus
	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int minusCount(List<String> minusOptionList, String optionMinusCount) {
		
		int result = 0;
		
		Map<String, Object> cartMinus = new HashMap<String, Object>();
		
		cartMinus.put("optionMinusCount", optionMinusCount);
		
		for(int i=0; i<minusOptionList.size(); i++) {
			cartMinus.put("optionNoMinus", minusOptionList.get(i));
			
			result = dao.minusCount(cartMinus);
		}
		return result;
	}
	
	// 장바구니 내 옵션 수량 변경 - PLUS
	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int plusCount(List<String> plusOptionList, String optionPlusCount) {
		
		int result = 0;
		
		Map<String, Object> cartPlus = new HashMap<String, Object>();
		
		cartPlus.put("optionPlusCount", optionPlusCount);
		
		for(int i=0; i<plusOptionList.size(); i++) {
			cartPlus.put("optionNoPlus", plusOptionList.get(i));
			
			result = dao.plusCount(cartPlus);
		}
		return result;
	}
	
	// 장바구니 -> 주문 페이지 내 옵션에 따른 상품, 옵션 조회
	@Override
	public List<OptionType> cartOrder(Map<String, Object> map) {
			
		return dao.cartOrder(map);

	}

	// 장바구니 - 결제 성공 시 OPTION_TB UPDATE
	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int updateOptionTb(List<String> optionNoList, String pOrderCode) {
		
		int result = 0;
		
		Map<String, Object> optionUpdateMap = new HashMap<String, Object>();
		
		optionUpdateMap.put("pOrderCode", pOrderCode);
		
		for(int i=0; i<optionNoList.size(); i++) {
			optionUpdateMap.put("optionNo", optionNoList.get(i));
			
			result = dao.updateOptionTb(optionUpdateMap);
		}
		return result;
	}
	
	// 장바구니 -> 결제 진행 시 장바구니 테이블 삭제
	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int deleteCart(List<String> optionNoList, int memberNo) {
		
		int result = 0;
		
		Map<String, Object> cartDelteMap = new HashMap<String, Object>();
		
		cartDelteMap.put("memberNo", memberNo);
		
		for(int i=0; i<optionNoList.size(); i++) {
			cartDelteMap.put("optionNo", optionNoList.get(i));
			
			result = dao.deleteCart(cartDelteMap);
		}
		return result;
	}
}
