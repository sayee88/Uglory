package edu.kh.ugloryA.product.model.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import edu.kh.ugloryA.farm.model.vo.Farm;
import edu.kh.ugloryA.payment.model.vo.SubsPaymentDetail;
import edu.kh.ugloryA.product.model.vo.OptionType;
import edu.kh.ugloryA.product.model.vo.Product;
import edu.kh.ugloryA.product.model.vo.ProductCategory;
import edu.kh.ugloryA.product.model.vo.WeeklyList;
import edu.kh.ugloryA.product.model.vo.WeeklyProduct;

public interface ProductService {

	/**
	 * 상품 전체 조회
	 * @return productList
	 */
	List<Product> selectAll();

	/**
	 * 상품 상세 조회
	 * @param productCode
	 * @return detailMap
	 */
	Map<String, Object> productDetail(int productCode);

	/**
	 * 상품 품절 처리 서비스
	 * @param productCode
	 * @return result
	 */
	int soldout(int productCode);

	/**
	 * 상품 입고 처리 서비스
	 * @param productCode
	 * @return result
	 */
	int stocked(int productCode);

	/**
	 * 상품 카테고리 조회
	 * @return catedoryList
	 */
	List<ProductCategory> selectCategory();

	/**
	 * 상품 농장 조회
	 * @return farmList
	 */
	List<Farm> selectFarmList();

	/**
	 * 상품 등록 Service
	 * @param product
	 * @param imageList
	 * @param webPath
	 * @param folderPath
	 * @return productCode
	 */
	int insertProduct(Product product, List<MultipartFile> imageList, String webPath, String folderPath) throws IOException;

	/**
	 * 상품 수정 Service
	 * @param product
	 * @return result
	 */
	int updateProduct(Product product, List<MultipartFile> imageList, String webPath, String folderPath) throws IOException;

	/**
	 * 옵션 등록 Service
	 * @param optionType
	 * @return result
	 */
	int insertOption(OptionType optionType);

	/**
	 * 옵션 삭제 Service
	 * @param optionCode
	 * @return result
	 */
	int deleteOption(int optionCode);

	/**
	 * 주별 상품 리스트 조회
	 * @param key
	 * @return weeklyList
	 */
	WeeklyList selectWeeklyList(String key);

	/**
	 * 주별 상품 리스트 만들기
	 * @param key
	 * @return result
	 */
	int insertWeeklyList(String key);

	/**
	 * 주별 상품 목록 조회
	 * @param productListNo
	 * @return deliveryList
	 */
	List<WeeklyProduct> selectWeeklyProduct(int productListNo);

	/**
	 * 상품 옵션 조회
	 * @param productCode
	 * @return optionList
	 */
	List<OptionType> selectOption(int productCode);

	/**
	 * 상품 목록 중복 검사
	 * @param map
	 * @return result
	 */
	int listDupCheck(Map<String, Object> map);

	/**
	 * 상품 목록 추가
	 * @param map
	 * @return result
	 */
	int insertWeeklyProduct(Map<String, Object> map);

	/**
	 * 상품 목록 삭제
	 * @param productNo
	 * @return result
	 */
	int deleteWeeklyProduct(int productNo);

	/**
	 * 주별 상품 업데이트(스케쥴러용)
	 * @return count
	 */
	int weeklyUpdate();

	/**
	 * 구독 멤버 번호 조회
	 * @return phoneList
	 */
	List<String> selectPhoneList();

	/**
	 * 알림 발송용 상품 목록 조회
	 * @return deliveryList
	 */
	List<WeeklyProduct> selectThisWeek();

	/**
	 * 상품 이미지 목록 조회해오기
	 * @return productDBList
	 */
	List<String> selectProductDBList();
	
}
