package edu.kh.ugloryA.payment.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.ugloryA.payment.model.vo.Payment;

@Repository
public class PaymentDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private Logger logger = LoggerFactory.getLogger(PaymentDAO.class);

	
	
	/**
	 * 전체 결제 내역 조회 DAO
	 * @return
	 */
	public List<Payment> selectAllPayment() {
		return sqlSession.selectList("paymentMapper.selectAllPayment");
	}

	
	/**
	 * 결제 내역 검색 조회 DAO
	 * @param key
	 * @param query
	 * @return
	 */
	public List<Payment> searchPayment(String key, String query) {
		
		Map<String,	Object> map = new HashMap<String, Object>();
		map.put("key", key);
		map.put("query", query);
		
		return sqlSession.selectList("paymentMapper.searchPayment", map);
	}
	
}
