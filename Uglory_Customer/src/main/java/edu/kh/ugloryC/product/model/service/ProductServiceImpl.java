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

	// 총 가격 조회 서비스 구현
//	@Override
//	public int totalAmount(Map<String, Object> map) {
//		
//		return dao.totalAmount(map);
//	}

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

	
}
