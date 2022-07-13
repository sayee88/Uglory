package edu.kh.ugloryC.product.model.service;

import edu.kh.ugloryC.product.model.vo.ProductDetail;

public interface ProductService {

	/** 상품 상세 조회 서비스
	 * @param productCode
	 * @return detail
	 */
	ProductDetail productDetail(int productCode);

	/** 총 금액 계산 서비스
	 * @param optionCode
	 * @param productCode
	 * @return result
	 */
	int totalAmount(int optionCode, int productCode);

}
