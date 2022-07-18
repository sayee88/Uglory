package edu.kh.ugloryA.payment.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.ugloryA.payment.model.vo.Chart;
import edu.kh.ugloryA.payment.model.vo.Payment;
import edu.kh.ugloryA.payment.model.vo.ProductPaymentDetail;
import edu.kh.ugloryA.payment.model.vo.SubsPaymentDetail;

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


	/**
	 * 주문 번호로 개별 or 구독 여부 확인
	 * @param orderCode
	 * @return
	 */
	public int checkOrder(String orderCode) {
		return sqlSession.selectOne("paymentMapper.checkOrder", orderCode);
	}


	/**
	 * 개별 상품 상세 조회
	 * @param orderCode
	 * @return pPaymentDetail
	 */
	public ProductPaymentDetail selectProductPaymentDetail(String orderCode) {
		return sqlSession.selectOne("paymentMapper.selectProductPaymentDetail", orderCode);
	}


	/**
	 * 구독 상품 상세 조회
	 * @param orderCode
	 * @return sPaymentDetail
	 */
	public SubsPaymentDetail selectSubsPaymentDetail(String orderCode) {
		return sqlSession.selectOne("paymentMapper.selectSubsPaymentDetail", orderCode);
	}

	
}
