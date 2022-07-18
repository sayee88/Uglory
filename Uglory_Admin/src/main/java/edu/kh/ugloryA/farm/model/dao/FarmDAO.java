package edu.kh.ugloryA.farm.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.ugloryA.farm.model.vo.Farm;

@Repository
public class FarmDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/**
	 * 농장 리스트 조회 DAO
	 * @return farmList
	 */
	public List<Farm> selectFarmList() {
		return sqlSession.selectList("farmMapper.seletFarmList");
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

}
