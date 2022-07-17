package edu.kh.ugloryA.product.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import edu.kh.ugloryA.farm.model.vo.Farm;
import edu.kh.ugloryA.product.model.dao.ProductDAO;
import edu.kh.ugloryA.product.model.vo.OptionType;
import edu.kh.ugloryA.product.model.vo.Product;
import edu.kh.ugloryA.product.model.vo.ProductCategory;
import edu.kh.ugloryA.product.model.vo.ProductImage;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductDAO dao;

	// 상품 전체 조회 구현
	@Override
	public List<Product> selectAll() {
		return dao.selectAll();
	}

	//상품 상세 조회 구현
	@Override
	public Map<String, Object> productDetail(int productCode) {
		
		//상품 정보
		Product product = dao.selectProduct(productCode);
		
		//농장 정보
		Farm farm = dao.selectFarm(productCode);
		
		//옵션 정보
		List<OptionType> optionList = dao.selectOptionType(productCode);
		
		//상품이미지
		List<ProductImage> imageList = dao.selectPImage(productCode);
		
		Map<String, Object> detailMap = new HashMap<String, Object>();
		
		detailMap.put("product", product);
		detailMap.put("farm", farm);
		detailMap.put("optionType", optionList);
		detailMap.put("productImage", imageList);
		
		return detailMap;
	}

	//상품 품절 처리
	@Override
	public int soldout(int productCode) {
		return dao.soldout(productCode);
	}

	//상품 입고 처리
	@Override
	public int stocked(int productCode) {
		return dao.stocked(productCode);
	}

	//상품 카테고리 조회
	@Override
	public List<ProductCategory> selectCategory() {
		return dao.selectCategory();
	}

	//상품 농장 조회
	@Override
	public List<Farm> selectFarmList() {
		return dao.selectFarmList();
	}

	//상품 등록 서비스 구현
	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int insertProduct(Product product, List<MultipartFile> imageList, String webPath, String folderPath) {
		
		//게시글 삽입
		
		//이미지 삽입
		
		//서버에 이미지 저장
		
		return 0;
	}
	
	
	
	
	

}
