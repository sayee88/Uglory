package edu.kh.ugloryA.farm.model.service;

import java.util.List;

import edu.kh.ugloryA.farm.model.vo.Farm;

public interface FarmService {

	/**
	 * 농장 리스트 조회 Service
	 * @return farmList
	 */
	List<Farm> selectFarmList();

	/**
	 * 농장 삭제 Service
	 * @param farmNo
	 * @return result
	 */
	int deleteFarm(int farmNo);

	/**
	 * 농장의 상품 수 세기
	 * @param farmNo
	 * @return count
	 */
	int countFarm(int farmNo);

}
