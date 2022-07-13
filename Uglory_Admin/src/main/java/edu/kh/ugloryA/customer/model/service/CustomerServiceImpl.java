package edu.kh.ugloryA.customer.model.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.ugloryA.customer.model.dao.CustomerDAO;
import edu.kh.ugloryA.customer.model.vo.Customer;

@Service
public class CustomerServiceImpl implements CustomerService {
	
	@Autowired
	private CustomerDAO dao;
	
	private Logger logger = LoggerFactory.getLogger(CustomerServiceImpl.class);

	// 전체 고객 목록 조회
	@Override
	public List<Customer> selectAllCustomer() {
		return dao.selectAllCustomer();
	}

	
	// 특정 조건을 만족하는 고객 목록 조회
	@Override
	public List<Customer> searchCustomer(String key, String query) {
		return dao.searchCustomer(key, query);
	}
	
}
