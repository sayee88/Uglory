package edu.kh.ugloryC.product.model.service;

import java.util.List;

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

}
