package edu.kh.ugloryC.product.model.service;

import java.util.Map;

import edu.kh.ugloryC.product.model.vo.ProductDetail;

public interface ProductService {

	/** 상품 상세 조회 서비스
	 * @param productCode
	 * @return detail
	 */
	ProductDetail productDetail(int productCode);

	/** 총 가격 조회 서비스
	 * @param paramMap
	 * @return result
	 */
	int totalAmount(Map<String, Object> paramMap);


}
