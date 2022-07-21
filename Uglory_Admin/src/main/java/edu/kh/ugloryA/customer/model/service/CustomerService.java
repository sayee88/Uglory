package edu.kh.ugloryA.customer.model.service;

import java.util.List;

import edu.kh.ugloryA.customer.model.vo.Customer;

public interface CustomerService {

	/**
	 * ��ü �� ��� ��ȸ
	 * @return customerList
	 */
	List<Customer> selectAllCustomer();

	
	/**
	 * Ư�� ������ �����ϴ� �� ��� ��ȸ
	 * @param key
	 * @param query
	 * @return customerList
	 */
	List<Customer> searchCustomer(String key, String query);


	/**
	 * ȸ�� ���� ����
	 * @param customerNo
	 * @return
	 */
	int changeStatement(int customerNo);


	/**
	 * 회원 수 조회
	 * @return
	 */
	int countCustomer();


	
	

}
