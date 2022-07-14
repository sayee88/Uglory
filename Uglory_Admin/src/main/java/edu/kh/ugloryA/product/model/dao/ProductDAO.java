package edu.kh.ugloryA.product.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.ugloryA.product.model.vo.Product;

@Repository
public class ProductDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/**
	 * 상품 전체 조회 DAO
	 * @return productList
	 */
	public List<Product> selectAll() {
		return sqlSession.selectList("productMapper.selectAll");
	}
	
	

}
