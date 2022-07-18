package edu.kh.ugloryC.product.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import edu.kh.ugloryC.product.model.vo.ProductList;

@Repository
public class ProductListDAO {
	
	private SqlSessionTemplate sqlSession;

	public List<ProductList> productList() {
		return sqlSession.selectList("productListMapper.productList");
	}

	
}
