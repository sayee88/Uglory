package edu.kh.ugloryA.product.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.ugloryA.farm.model.vo.Farm;
import edu.kh.ugloryA.payment.model.vo.SubsPaymentDetail;
import edu.kh.ugloryA.product.model.vo.OptionType;
import edu.kh.ugloryA.product.model.vo.Product;
import edu.kh.ugloryA.product.model.vo.ProductCategory;
import edu.kh.ugloryA.product.model.vo.ProductImage;
import edu.kh.ugloryA.product.model.vo.WeeklyList;
import edu.kh.ugloryA.product.model.vo.WeeklyProduct;

@Repository
public class ProductDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/**
	 * 상품 전체 조회 DAO
	 * @return productList
	 */
	public List<Product> selectAll() {
		return sqlSession.selectList("productMapper.selectAll");
	}

	/**
	 * 상품 상세조회(상품)
	 * @param productCode
	 * @return product
	 */
	public Product selectProduct(int productCode) {
		return sqlSession.selectOne("productMapper.selectProduct", productCode);
	}

	/**
	 * 상품 상세조회(농장)
	 * @param productCode
	 * @return farm
	 */
	public Farm selectFarm(int productCode) {
		return sqlSession.selectOne("productMapper.selectFarm", productCode);
	}

	/**
	 * 상품 상세조회(옵션)
	 * @param productCode
	 * @return optionList
	 */
	public List<OptionType> selectOptionType(int productCode) {
		return sqlSession.selectList("productMapper.selectOptionType", productCode);
	}

	/**
	 * 상품 상세조회(이미지)
	 * @param productCode
	 * @return imageList
	 */
	public List<ProductImage> selectPImage(int productCode) {
		return sqlSession.selectList("productMapper.selectPImage", productCode);
	}

	/**
	 * 상품 품절 처리 DAO
	 * @param productCode
	 * @return result
	 */
	public int soldout(int productCode) {
		return sqlSession.update("productMapper.soldout", productCode);
	}

	/**
	 * 상품 입고 처리 DAO
	 * @param productCode
	 * @return result
	 */
	public int stocked(int productCode) {
		return sqlSession.update("productMapper.stocked", productCode);
	}

	/**
	 * 카테고리 조회
	 * @return categoryList
	 */
	public List<ProductCategory> selectCategory() {
		return sqlSession.selectList("productMapper.selectCategory");
	}

	/**
	 * 상품 농장리스트 조회
	 * @return farmList
	 */
	public List<Farm> selectFarmList() {
		return sqlSession.selectList("productMapper.selectFarmList");
	}

	/**
	 * 상품 등록 DAO
	 * @param product
	 * @return result
	 */
	public int insertProduct(Product product) {
		
		int result = sqlSession.insert("productMapper.insertProduct", product);
		
		if(result>0) result = product.getProductCode();
		
		return result;
	}

	/**
	 * 이미지 삽입(리스트)DAO
	 * @param productImageList
	 * @return result
	 */
	public int insertProductImage(List<ProductImage> productImageList) {
		return sqlSession.insert("productMapper.insertProductImage", productImageList);
	}
	
	/**
	 * 이미지 수정
	 * @param img
	 * @return result
	 */
	public int updateProductImage(ProductImage img) {
		return sqlSession.update("productMapper.updateProductImage", img);
	}

	/**
	 * 이미지 삽입(1개)
	 * @param img
	 * @return result
	 */
	public int insertImageOne(ProductImage img) {
		return sqlSession.insert("productMapper.insertImageOne", img);
	}
	

	/**
	 * 상품 수정 DAO
	 * @param product
	 * @return result
	 */
	public int updateProduct(Product product) {
		return sqlSession.update("productMapper.updateProduct", product);
	}

	/**
	 * 옵션 등록 DAO
	 * @param optionType
	 * @return result
	 */
	public int insertOption(OptionType optionType) {
		return sqlSession.insert("productMapper.insertOption", optionType);
	}

	/**
	 * 옵션 삭제 DAO
	 * @param optionCode
	 * @return result
	 */
	public int deleteOption(int optionCode) {
		return sqlSession.delete("productMapper.deleteOption", optionCode);
	}

	/**
	 * 주별 상품 리스트 조회
	 * @param key
	 * @return weeklyList
	 */
	public WeeklyList selectWeeklyList(String key) {
		return sqlSession.selectOne("productMapper.selectWeeklyList", key);
	}

	/**
	 * 리스트 만들기 DAO
	 * @param ex
	 * @return result
	 */
	public int insertWeeklyList(String key) {
		return sqlSession.insert("productMapper.insertWeeklyList", key);
	}


	/**
	 * 리스트 내 상품 모두 조회
	 * @param productListNo
	 * @return weeklyProductList
	 */
	public List<WeeklyProduct> selectWeeklyProduct(int productListNo) {
		return sqlSession.selectList("productMapper.selectWeeklyProduct", productListNo);
	}

	/**
	 * 상품 목록 중복 검사
	 * @param map
	 * @return result
	 */
	public int listDupCheck(Map<String, Object> map) {
		return sqlSession.selectOne("productMapper.listDupCheck", map);
	}

	/**
	 * 상품 목록 추가
	 * @param map
	 * @return result
	 */
	public int insertWeeklyProduct(Map<String, Object> map) {
		return sqlSession.insert("productMapper.insertWeeklyProduct", map);
	}

	/**
	 * 상품 목록 삭제
	 * @param productNo
	 * @return result
	 */
	public int deleteWeeklyProduct(int productNo) {
		return sqlSession.delete("productMapper.deleteWeeklyProduct", productNo);
	}

	/**
	 * 주별 상품 업데이트(스케쥴러용)
	 * @param key
	 * @return result
	 */
	public int weeklyUpdate(String key) {
		return sqlSession.update("productMapper.weeklyUpdate", key);
	}

	/**
	 * 구독 멤버 번호 조회
	 * @return phoneList
	 */
	public List<String> selectPhoneList() {
		return sqlSession.selectList("productMapper.selectPhoneList");
	}

	/**
	 * 알림 발송용 이번주 내역 발송
	 * @return deliveryList
	 */
	public List<WeeklyProduct> selectThisWeek() {
		return sqlSession.selectList("productMapper.selectThisWeek");
	}

	/**
	 * 상품 이미지 디비리스트 조회
	 * @return produtctDBList
	 */
	public List<String> selectProductDBList() {
		return sqlSession.selectList("productMapper.selectProductDBList");
	}

	/**
	 * 사용중인 옵션 개수 조회
	 * @param optionCode
	 * @return count
	 */
	public int countOption(int optionCode) {
		return sqlSession.selectOne("productMapper.countOption", optionCode);
	}

}
