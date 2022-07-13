package edu.kh.ugloryA.customer.model.service;

import java.util.List;

import edu.kh.ugloryA.customer.model.vo.Customer;

public interface CustomerService {

	/**
	 * 전체 고객 목록 조회
	 * @return list
	 */
	List<Customer> selectAllCustomer();

}
