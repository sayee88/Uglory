package edu.kh.ugloryA.product.model.service;

import java.util.List;

import edu.kh.ugloryA.product.model.vo.Product;

public interface ProductService {

	/**
	 * 상품 전체 조회
	 * @return productList
	 */
	List<Product> selectAll();

}
