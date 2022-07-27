package edu.kh.ugloryA.customer.model.service;

import java.util.List;
import java.util.Map;

import edu.kh.ugloryA.customer.model.vo.Customer;

public interface CustomerService {

	/**
	 * ��ü �� ��� ��ȸ
	 * @return customerList
	 */
	Map<String, Object> selectAllCustomer(int cp);

	
	/**
	 * Ư�� ������ �����ϴ� �� ��� ��ȸ
	 * @param key
	 * @param query
	 * @return customerList
	 */
	Map<String, Object> searchCustomer(String key, String query);


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
