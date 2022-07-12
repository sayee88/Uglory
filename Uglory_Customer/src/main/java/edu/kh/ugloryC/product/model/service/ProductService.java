package edu.kh.ugloryC.product.model.service;

import edu.kh.ugloryC.product.model.vo.ProductDetail;

public interface ProductService {

	/** 상품 상세 조회 서비스
	 * @param pCode
	 * @return detail
	 */
	ProductDetail productDetail(int pCode);

}
