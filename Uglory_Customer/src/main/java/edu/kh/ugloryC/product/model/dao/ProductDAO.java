package edu.kh.ugloryC.product.model.dao;

import java.util.Map;

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

	/** 총 가격 조회 DAO
	 * @param paramMap
	 * @return result
	 */
	public int totalAmount(Map<String, Object> paramMap) {
		return sqlSession.selectOne("productMapper.totalAmount", paramMap);
	}
}
