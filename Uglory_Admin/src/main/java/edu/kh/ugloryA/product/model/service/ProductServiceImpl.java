package edu.kh.ugloryA.product.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.ugloryA.product.model.dao.ProductDAO;
import edu.kh.ugloryA.product.model.vo.Product;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductDAO dao;

	// 상품 전체 조회 구현
	@Override
	public List<Product> selectAll() {
		return dao.selectAll();
	}

}
