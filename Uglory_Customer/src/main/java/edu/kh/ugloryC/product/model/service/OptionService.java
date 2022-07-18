package edu.kh.ugloryC.product.model.service;

import java.util.List;
import java.util.Map;

import edu.kh.ugloryC.product.model.vo.OptionType;

public interface OptionService {

	/** 옵션 조회 서비스
	 * @param productCode
	 * @return optionList
	 */
	List<OptionType> selectOptionList(int productCode);

	/** 주문 페이지 내 옵셩 정보 조회 서비스
	 * @param map
	 * @return selectOptionList
	 */
	List<OptionType> orderOptionSelect(Map<String, Object> map);

//	/** 선택된 옵션 리스트 서비스 - js로 구현
//	 * @param optionCode
//	 * @return optionList
//	 */
//	List<OptionType> selectOption(int optionCode);

}
