package edu.kh.ugloryA.farm.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.ugloryA.customer.model.vo.Pagination;
import edu.kh.ugloryA.farm.model.vo.Farm;

@Repository
public class FarmDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/**
	 * 농장 리스트 조회 DAO
	 * @param pagination 
	 * @return farmList
	 */
	public List<Farm> selectFarmList(Pagination pagination) {
		
		int offset = (pagination.getCurrentPage()-1) * pagination.getLimit();
		
		RowBounds rowbounds = new RowBounds(offset, pagination.getLimit());
		
		return sqlSession.selectList("farmMapper.seletFarmList", null, rowbounds);
	}

	/**
	 * 농장 삭제 DAO
	 * @param farmNo
	 * @return result
	 */
	public int deleteFarm(int farmNo) {
		return sqlSession.update("farmMapper.deleteFarm", farmNo);
	}

	/**
	 * 농장 상품 수 세기 DAO
	 * @param farmNo
	 * @return count
	 */
	public int countFarm(int farmNo) {
		return sqlSession.selectOne("farmMapper.countFarm", farmNo);
	}

	/**
	 * 농장명 중복 검사 DAO
	 * @param farmName
	 * @return result
	 */
	public int farmNameDupCheck(String farmName) {
		return sqlSession.selectOne("farmMapper.farmNameDupCheck", farmName);
	}

	/**
	 * 농장 등록 DAO
	 * @param farm
	 * @return result
	 */
	public int insertFarm(Farm farm) {
		return sqlSession.insert("farmMapper.insertFarm", farm);
	}

	/**
	 * 농장 수 세기
	 * @return
	 */
	public int countFarmNo() {
		return sqlSession.selectOne("farmMapper.countFarmNo");
	}

}
