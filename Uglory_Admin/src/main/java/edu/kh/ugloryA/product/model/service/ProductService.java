package edu.kh.ugloryA.product.model.service;

import java.util.List;
import java.util.Map;

import edu.kh.ugloryA.product.model.vo.Product;

public interface ProductService {

	/**
	 * 상품 전체 조회
	 * @return productList
	 */
	List<Product> selectAll();

	/**
	 * 상품 상세 조회
	 * @param productCode
	 * @return detailMap
	 */
	Map<String, Object> productDetail(int productCode);

}
