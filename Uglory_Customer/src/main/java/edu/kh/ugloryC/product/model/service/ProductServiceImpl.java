package edu.kh.ugloryC.product.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.ugloryC.product.model.dao.ProductDAO;
import edu.kh.ugloryC.product.model.vo.OptionType;
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

	// 장바구니 페이지 내 옵션, 상품 조회
	@Override
	public List<OptionType> cartOptionList(Map<String, Object> cartMap) {

		return dao.cartOptionList(cartMap);
	}

}
