package edu.kh.ugloryC.main.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.ugloryC.main.model.vo.DeliveryProduct;

@Repository
public class MainDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<DeliveryProduct> thisDeliveryProduct() {
		return sqlSession.selectList("mainMapper.thisDeliveryProduct");
	}

	public List<DeliveryProduct> nextDeliveryProduct() {
		return sqlSession.selectList("mainMapper.nextDeliveryProduct");
	}
	
}
