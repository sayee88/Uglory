package edu.kh.ugloryA.customer.model.dao;

import java.util.List;

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
	 * @return
	 */
	public List<Customer> selectAllCustomer() {
		return sqlSession.selectList("customerMapper.selectAllCustomer");
	}
	
	
}
