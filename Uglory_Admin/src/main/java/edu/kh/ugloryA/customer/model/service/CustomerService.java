package edu.kh.ugloryA.customer.model.service;

import java.util.List;

import edu.kh.ugloryA.customer.model.vo.Customer;

public interface CustomerService {

	/**
	 * 전체 고객 목록 조회
	 * @return customerList
	 */
	List<Customer> selectAllCustomer();

	
	/**
	 * 특정 조건을 만족하는 고객 목록 조회
	 * @param key
	 * @param query
	 * @return customerList
	 */
	List<Customer> searchCustomer(String key, String query);

}
