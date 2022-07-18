package edu.kh.ugloryC.product.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.ugloryC.product.model.vo.ProductList;

@Repository
public class ProductListDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<ProductList> productList() {
		
		List<ProductList> productList = sqlSession.selectList("productListMapper.productList");
		
		return productList;
	}

	public List<ProductList> category(int selectCategoryNo) {
		return sqlSession.selectList("productListMapper.category", selectCategoryNo);
	}

	
}
