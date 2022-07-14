package edu.kh.ugloryA.customer.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.ugloryA.customer.model.vo.Customer;

@Repository
public class CustomerDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private Logger logger = LoggerFactory.getLogger(CustomerDAO.class);

	/**
	 * 전체 고객 목록 조회 DAO
	 * @return customerList
	 */
	public List<Customer> selectAllCustomer() {
		return sqlSession.selectList("customerMapper.selectAllCustomer");
	}

	
	/**
	 * 특정 조건을 만족하는 고객 목록 조회 DAO
	 * @param key
	 * @param query
	 * @return customerList
	 */
	public List<Customer> searchCustomer(String key, String query) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("key", key);
		map.put("query", query);
		
		return sqlSession.selectList("customerMapper.searchCustomer", map);
	}

	
	/**
	 * 회원 상태 조회 DAO
	 * @param customerNo
	 * @return
	 */
	public String selectAccountFlag(int customerNo) {
		return sqlSession.selectOne("customerMapper.selectAccountFlag", customerNo);
	}


	/**
	 * 회원 계정 정지 DAO
	 * @param customerNo
	 * @return
	 */
	public int stopAccount(int customerNo) {
		return sqlSession.update("customerMapper.stopAccount", customerNo);
	}


	/**
	 * 회원 계정 활성화 DAO
	 * @param customerNo
	 * @return
	 */
	public int activeAccount(int customerNo) {
		return sqlSession.update("customerMapper.activeAccount", customerNo);
	}



	
	
}
