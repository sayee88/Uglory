package edu.kh.ugloryC.product.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.ugloryC.product.model.vo.ProductDetail;

@Repository
public class ProductDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/** 상품 상세조회 DAO
	 * @param productCode
	 * @return detail
	 */
	public ProductDetail productDetail(int productCode) {
		
		return sqlSession.selectOne("productMapper.productDetail", productCode);
	}

	public int totalAmount(int optionCode, int productCode) {

		return sqlSession.selectOne(null);
	}
}
