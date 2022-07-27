package edu.kh.ugloryC.main.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.ugloryC.main.model.dao.MainDAO;
import edu.kh.ugloryC.main.model.vo.DeliveryProduct;
import edu.kh.ugloryC.main.model.vo.RecentReview;

@Service
public class MainServiceImpl implements MainService {

	@Autowired
	private MainDAO dao;

	//이번주 배송목록
	@Override
	public List<DeliveryProduct> thisDeliveryProduct() {
		return dao.thisDeliveryProduct();
	}

	//다음주 배송목록
	@Override
	public List<DeliveryProduct> nextDeliveryProduct() {
		return dao.nextDeliveryProduct();
	}

	//농장 개수 세기
	@Override
	public int farmCount() {
		return dao.farmCount();
	}

	//상품 개수 세기
	@Override
	public int productCount() {
		return dao.productCount();
	}

	//최근 리뷰 조회하기
	@Override
	public List<RecentReview> selectRecentReview() {
		return dao.selectRecentReview();
	} 
	
}
