package edu.kh.ugloryC.product.model.service;

import java.util.List;

import edu.kh.ugloryC.product.model.vo.OptionType;

public interface OptionService {

	/** 옵션 조회 서비스
	 * @param productCode
	 * @return optionList
	 */
	List<OptionType> selectOptionList(int productCode);

}
