package edu.kh.ugloryC.product.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.ugloryC.product.model.vo.OptionType;
import edu.kh.ugloryC.product.model.vo.ProductCart;
import edu.kh.ugloryC.product.model.vo.ProductDetail;
import edu.kh.ugloryC.product.model.vo.ProductOrder;

/**
 * @author user1
 *
 */
@Repository
public class ProductDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/** 상품 상세조회 DAO
	 * @param productCode
	 * @return detail
	 */
	public ProductDetail productDetail(int productCode) {
		
		return sqlSession.selectOne("productMapper.productDetail", productCode);
	}

	/** 상품 상세 페이지 별점 조회
	 * @param productCode
	 * @return result
	 */
	public double selectStar(int productCode) {
		
		return sqlSession.selectOne("productMapper.selectStar", productCode);
	}

	/** 상품 상세 페이지 리뷰 수 조회
	 * @param productCode
	 * @return count
	 */
	public int countReview(int productCode) {

		return sqlSession.selectOne("productMapper.countReview",productCode);
	}
	
	/** 주문 페이지 내 옵션에 따른 상품, 옵션 조회 DAO
	 * @param map
	 * @return selectOptionList
	 */
	public List<OptionType> orderOptionSelect(Map<String, Object> map) {

		return sqlSession.selectList("productMapper.orderOptionSelect", map);
	}
	
	/** 주문 정보 DAO
	 * @param productOrder
	 * @return result
	 */
	public int productOrder(Map<String, Object> productOrder) {

		return sqlSession.insert("productMapper.productOrder", productOrder);
	}

	/** 상품 주문번호 생성
	 * @return pOrderCode
	 */
	public String createProductOrderCode() {

		return sqlSession.selectOne("productMapper.createProductOrderCode");
	}

	
	/** 결제 정보 삽입
	 * @param productOrder
	 * @return productOrder
	 */
	public int productPay(Map<String, Object> productOrder) {
		
		return sqlSession.insert("productMapper.productPay", productOrder);
	}

	/** 장바구니 삽입을 위한 옵션 TB 삽입 (옵션 코드)
	 * @param string
	 * @return result
	 */
	public int insertOptionInfo(Map<String, Object> optionMap) {

		int result =  sqlSession.insert("productMapper.insertOptionInfo", optionMap);
		
		if(result > 0) {
			result = (int)optionMap.get("optionNo");
		}
		
		return result;
	}

	/** 장바구니 테이블 삽입   
	 * @param cartInsertMap
	 * @return insertProductCart
	 */
	public int insertProductCart(Map<String, Object> cartInsertMap) {
		
		return sqlSession.insert("productMapper.insertProductCart", cartInsertMap);
	}

	/** 장바구니 조회
	 * @param memberNo
	 * @return productCart
	 */
	public List<ProductCart> productCart(int memberNo) {

		return sqlSession.selectList("productMapper.productCart", memberNo);
	}

	/** 결제 시 OPTION_TB 테이블 삽입
	 * @param optionMap
	 * @return result
	 */
	public int insertOptionTb(Map<String, Object> optionMap) {

		return sqlSession.insert("productMapper.insertOptionTb", optionMap);
	}

	/** x버튼 클릭 시 장바구니 삭제 
	 * @param optionDeleteMap
	 * @return result
	 */
	public int cartDelete(Map<String, Object> optionDeleteMap) {

		return sqlSession.delete("productMapper.cartDelete", optionDeleteMap);
	}

	/** 장바구니 내 옵션 수량 변경 - Minus
	 * @param cartMinus
	 * @return result
	 */
	public int minusCount(Map<String, Object> cartMinus) {

		return sqlSession.update("productMapper.minusCount", cartMinus);
	}

	/** 장바구니 내 옵션 수량 변경 - PLUS
	 * @param cartPlus
	 * @return result
	 */
	public int plusCount(Map<String, Object> cartPlus) {
		
		return sqlSession.update("productMapper.plusCount", cartPlus);
	}

	/**  장바구니 -> 주문 페이지 내 옵션에 따른 상품, 옵션 조회
	 * @param optionNoList
	 * @return selectOptionList
	 */
	public List<OptionType> cartOrder(Map<String, Object> map) {
		
		return sqlSession.selectList("productMapper.cartOrder", map);
	}
 
	/** 장바구니 - 결제 성공 시 OPTION_TB UPDATE
	 * @param optionUpdateMap
	 * @return result
	 */
	public int updateOptionTb(Map<String, Object> optionUpdateMap) {
		
		return sqlSession.update("productMapper.updateOptionTb", optionUpdateMap);
	}

	/** 장바구니 -> 결제 진행 시 장바구니 테이블 삭제
	 * @param cartDelteMap
	 * @return result
	 */
	public int deleteCart(Map<String, Object> cartDelteMap) {

		return sqlSession.delete("productMapper.deleteCart", cartDelteMap);
	}
}
