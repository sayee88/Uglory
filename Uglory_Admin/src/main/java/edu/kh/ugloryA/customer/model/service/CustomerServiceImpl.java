package edu.kh.ugloryA.customer.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.ugloryA.customer.model.dao.CustomerDAO;
import edu.kh.ugloryA.customer.model.vo.Customer;
import edu.kh.ugloryA.customer.model.vo.Pagination;

@Service
public class CustomerServiceImpl implements CustomerService {
	
	@Autowired
	private CustomerDAO dao;
	
	private Logger logger = LoggerFactory.getLogger(CustomerServiceImpl.class);

	// ��ü �� ��� ��ȸ
	@Override
	public Map<String, Object> selectAllCustomer(int cp) {
		
		int listCount = dao.countCustomer();
		Pagination pagination = new Pagination(cp, listCount);
		
		List<Customer> customerList = dao.selectAllCustomer(pagination);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("pagination", pagination);
		map.put("customerList", customerList);
		
		return map;
	}

	
	// Ư�� ������ �����ϴ� �� ��� ��ȸ
	@Override
	public Map<String, Object> searchCustomer(String key, String query) {
		
		List<Customer> customerList = dao.searchCustomer(key, query);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("customerList", customerList);
		
		return map;
	}


	// ���� ���� ����
	@Override
	public int changeStatement(int customerNo) {
		
		int result = 0;
		
		String accountFlag = dao.selectAccountFlag(customerNo);
		
		if(accountFlag.equals("N")) {
			result = dao.stopAccount(customerNo);
		} else {
			result = dao.activeAccount(customerNo);
		}
		
		return result;
	}


	@Override
	public int countCustomer() {
		return dao.countCustomer();
	}
	
	
	


	
	
	
	
	
}
