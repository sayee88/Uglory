package edu.kh.ugloryA.farm.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.ugloryA.customer.model.vo.Pagination;
import edu.kh.ugloryA.farm.model.dao.FarmDAO;
import edu.kh.ugloryA.farm.model.vo.Farm;

@Service
public class FarmServiceImpl implements FarmService {

	@Autowired
	private FarmDAO dao;

	//농장 리스트 조회 서비스 구현
	@Override
	public Map<String, Object> selectFarmList(int cp) {
		
		int listCount = dao.countFarmNo();
		Pagination pagination = new Pagination(cp, listCount);
		
		List<Farm> farmList = dao.selectFarmList(pagination);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("farmList", farmList);
		map.put("pagination", pagination);
		
		return map;
	}

	//농장 삭제 서비스 구현
	@Override
	public int deleteFarm(int farmNo) {
		return dao.deleteFarm(farmNo);
	}

	//농장 상품 수 세기
	@Override
	public int countFarm(int farmNo) {
		return dao.countFarm(farmNo);
	}

	//농장명 중복 검사
	@Override
	public int farmNameDupCheck(String farmName) {
		return dao.farmNameDupCheck(farmName);
	}

	//농장 등록 서비스 구현
	@Override
	public int insertFarm(Farm farm) {
		return dao.insertFarm(farm);
	}
	
	
	
	
	
	
	
	
	
	
}
