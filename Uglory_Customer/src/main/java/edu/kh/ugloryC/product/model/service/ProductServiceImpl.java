package edu.kh.ugloryC.product.model.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.ugloryC.product.model.dao.ProductDAO;
import edu.kh.ugloryC.product.model.vo.ProductDetail;

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
	@Override
	public int totalAmount(Map<String, Object> paramMap) {
		
		return dao.totalAmount(paramMap);
	}
}
