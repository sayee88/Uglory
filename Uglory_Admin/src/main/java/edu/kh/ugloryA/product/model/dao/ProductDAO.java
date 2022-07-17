package edu.kh.ugloryA.product.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.ugloryA.farm.model.vo.Farm;
import edu.kh.ugloryA.product.model.vo.OptionType;
import edu.kh.ugloryA.product.model.vo.Product;
import edu.kh.ugloryA.product.model.vo.ProductCategory;
import edu.kh.ugloryA.product.model.vo.ProductImage;

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

	public List<ProductCategory> selectCategory() {
		return sqlSession.selectList("productMapper.selectCategory");
	}

	public List<Farm> selectFarmList() {
		return sqlSession.selectList("productMapper.selectFarmList");
	}

	
	

}
