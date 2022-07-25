package edu.kh.ugloryC.product.model.service;

import java.util.List;
import java.util.Map;

import edu.kh.ugloryC.product.model.vo.OptionType;
import edu.kh.ugloryC.product.model.vo.ProductCart;
import edu.kh.ugloryC.product.model.vo.ProductDetail;
import edu.kh.ugloryC.product.model.vo.ProductOrder;

public interface ProductService {

	/** 상품 상세 조회 서비스
	 * @param productCode
	 * @return detail
	 */
	ProductDetail productDetail(int productCode);

	/** 상품 상세 페이지 별점 조회
	 * @param productCode
	 * @return result
	 */
	double selectStar(int productCode);
	
	/** 상품 상세 페이지 리뷰 수 조회
	 * @param productCode
	 * @return count
	 */
	int countReview(int productCode);
	
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
	 * @return optionNoList
	 */
	List<Integer> insertOptionInfo(List<String> optionCodeList, List<Integer> amountList);

	/** 장바구니 테이블 삽입
	 * @param cartInsertMap
	 * @return insertProductCart
	 */
	int insertProductCart(Map<String, Object> cartInsertMap);

	/** 장바구니 조회
	 * @param memberNo
	 * @return productCart
	 */
	List<ProductCart> productCart(int memberNo);

	/** 결제 시 OPTION_TB 테이블 삽입
	 * @param optionCodeList
	 * @param amountList
	 * @param pOrderCode
	 * @return
	 */
	int insertOptionTb(List<String> optionCodeList, List<String> amountList, String pOrderCode);

	/** x버튼 클릭 시 장바구니 삭제 
	 * @param memberNo
	 * @param deleteList
	 * @return result
	 */
	int cartDelete(int memberNo, List<String> deleteList);

	/** 장바구니 내 옵션 수량 변경 - Minus
	 * @param minusOptionList
	 * @param optionMinusCount
	 * @return result
	 */
	int minusCount(List<String> minusOptionList, String optionMinusCount);

	/** 장바구니 내 옵션 수량 변경 - PLUS
	 * @param plusOptionList
	 * @param optionPlusCount
	 * @return result
	 */
	int plusCount(List<String> plusOptionList, String optionPlusCount);


	/** 장바구니 -> 주문 페이지 내 옵션에 따른 상품, 옵션 조회
	 * @param optionNo List
	 * @return selectOptionList
	 */
	List<OptionType> cartOrder(Map<String, Object> map);





	










}
