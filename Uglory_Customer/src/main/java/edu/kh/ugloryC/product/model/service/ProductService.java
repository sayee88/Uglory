package edu.kh.ugloryC.product.model.service;

import java.util.List;
import java.util.Map;

import edu.kh.ugloryC.product.model.vo.OptionType;
import edu.kh.ugloryC.product.model.vo.ProductDetail;
import edu.kh.ugloryC.product.model.vo.ProductOrder;

/**
 * @author user1
 *
 */
public interface ProductService {

	/** 상품 상세 조회 서비스
	 * @param productCode
	 * @return detail
	 */
	ProductDetail productDetail(int productCode);

//	/** 총 가격 조회 서비스
//	 * @param map
//	 * @return result
//	 */
//	int totalAmount(Map<String, Object> map);
	
	/** 주문 페이지 내 옵션에 따른 상품, 옵션 조회
	 * @param map
	 * @return selectOptionList
	 */
	List<OptionType> orderOptionSelect(Map<String, Object> map);

	/** 주문 정보
	 * @param paramMap
	 * @return result
	 */
	int productOrder(Map<String, Object> productOrder);

	/** 상품 주문번호 생성
	 * @return pOrderCode
	 */
	String createProductOrderCode();

	/** 결제 정보 삽입
	 * @param productOrder
	 * @return
	 */
	int productPay(Map<String, Object> productOrder);

	/** 장바구니 삽입을 위한 옵션 TB 삽입
	 * @param cartMap
	 * @return insertOptionInfo
	 */
	int insertOptionInfo(List<String> optionCodeList, List<Integer> amountList);
	
	/** 옵션 No 조회
	 * @param cartOptionMap
	 * @return selectOptionNo
	 */
	List<Integer> selectOptionNo(Map<String, Object> cartOptionMap);
	
	
	










}
