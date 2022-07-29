package edu.kh.ugloryA.farm.model.service;

import java.util.List;
import java.util.Map;

import edu.kh.ugloryA.farm.model.vo.Farm;

public interface FarmService {

	/**
	 * 농장 리스트 조회 Service
	 * @param cp 
	 * @return farmList
	 */
	Map<String, Object> selectFarmList(int cp);

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

	/**
	 * 농장명 중복 검사 Service
	 * @param farmName
	 * @return result
	 */
	int farmNameDupCheck(String farmName);

	/**
	 * 농장 등록 Service
	 * @param farm
	 * @return result
	 */
	int insertFarm(Farm farm);

}
