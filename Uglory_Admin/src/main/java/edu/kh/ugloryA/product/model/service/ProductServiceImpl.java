package edu.kh.ugloryA.product.model.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import edu.kh.ugloryA.common.Util;
import edu.kh.ugloryA.farm.model.vo.Farm;
import edu.kh.ugloryA.product.model.dao.ProductDAO;
import edu.kh.ugloryA.product.model.exception.InsertFailException;
import edu.kh.ugloryA.product.model.vo.OptionType;
import edu.kh.ugloryA.product.model.vo.Product;
import edu.kh.ugloryA.product.model.vo.ProductCategory;
import edu.kh.ugloryA.product.model.vo.ProductImage;
import edu.kh.ugloryA.product.model.vo.WeeklyList;
import edu.kh.ugloryA.product.model.vo.WeeklyProduct;

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
	public int insertProduct(Product product, List<MultipartFile> imageList, String webPath, String folderPath) throws IOException {
		
		//게시글 삽입
		int productCode = dao.insertProduct(product);
		
		if(productCode > 0) {
			
			List<ProductImage> productImageList = new ArrayList<ProductImage>();
			List<String> reNameList = new ArrayList<String>();
			
			//이미지 삽입
			for(int i=0; i<imageList.size(); i++) {
				
				if(imageList.get(i).getSize() > 0) {
					
					String reName = Util.fileRename( imageList.get(i).getOriginalFilename() );
					reNameList.add(reName);
					
					ProductImage img = new ProductImage();
					img.setProductCode(productCode);
					img.setImageLevel(i);
					img.setImageRename(reName);
					img.setImageRoot(webPath + reName);
					
					productImageList.add(img);
				}
			}
			
			//서버에 이미지 저장
			if(!productImageList.isEmpty()) {
				int result = dao.insertProductImage(productImageList);
				
				if(result == productImageList.size()) {
					
					for(int i=0; i<productImageList.size(); i++) {
						
						int index = productImageList.get(i).getImageLevel();
						imageList.get(index).transferTo(new File(folderPath + reNameList.get(i)));
						
					}
					
				} else {
					throw new InsertFailException();
				}
			}
		}
		return productCode;
	}

	//상품 1개 조회
	@Override
	public Product selectProduct(int productCode) {
		return dao.selectProduct(productCode);
	}

	//상품 수정 서비스 구현
	@Override
	public int updateProduct(Product product) {
		return dao.updateProduct(product);
	}

	//옵션 등록 서비스 구현
	@Override
	public int insertOption(OptionType optionType) {
		return dao.insertOption(optionType);
	}

	//옵션 삭제 서비스 구현
	@Override
	public int deleteOption(int optionCode) {
		return dao.deleteOption(optionCode);
	}

	//주별 상품 리스트 조회
	@Override
	public Map<String, Object> selectWeeklyList(String key) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		// 상태별 리스트 조회
		WeeklyList weeklyList = dao.selectWeeklyList(key);
		
		if(weeklyList != null) {
			
			int productListNo = weeklyList.getProductListNo();
			
			// 리스트 내 상품 모두 조회
			List<WeeklyProduct> weeklyProductList = dao.selectWeeklyProduct(productListNo);
			
			map.put("weeklyProductList", weeklyProductList);
			map.put("weeklyList", weeklyList);			
		}
		
		return map;
	}
	
	
	
	
	
	
	
	
	

}
