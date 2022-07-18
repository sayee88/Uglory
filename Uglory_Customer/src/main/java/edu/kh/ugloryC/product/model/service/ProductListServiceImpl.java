package edu.kh.ugloryC.product.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.ugloryC.product.model.dao.ProductListDAO;
import edu.kh.ugloryC.product.model.vo.ProductList;

@Service
public class ProductListServiceImpl implements ProductListService{
	
	@Autowired
	private ProductListDAO dao;

	@Override
	public List<ProductList> productList() {
		return dao.productList();
	}

	
	

}
