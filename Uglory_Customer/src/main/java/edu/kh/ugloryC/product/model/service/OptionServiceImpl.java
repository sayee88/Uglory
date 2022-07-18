package edu.kh.ugloryC.product.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.ugloryC.product.model.dao.OptionDAO;
import edu.kh.ugloryC.product.model.vo.OptionType;

@Service
public class OptionServiceImpl implements OptionService {
	
	@Autowired
	private OptionDAO dao;
	
	// 옵션 조회 서비스 구현
	@Override
	public List<OptionType> selectOptionList(int productCode) {

		return dao.selectOptionList(productCode);
	}

	// 주문 페이지 내 옵션 조회 서비스 구현
	@Override
	public List<OptionType> orderOptionSelect(Map<String, Object> map) {

		return dao.orderOptionSelect(map);
	}

	// 선택된 옵션 리스트 서비스 구현 - JS로 구현
//	@Override
//	public List<OptionType> selectOption(int optionCode) {
//		
//		return dao.selectOption(optionCode);
//	}
	
	

}
