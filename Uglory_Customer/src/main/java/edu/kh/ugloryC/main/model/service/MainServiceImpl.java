package edu.kh.ugloryC.main.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.ugloryC.main.model.dao.MainDAO;
import edu.kh.ugloryC.main.model.vo.DeliveryProduct;

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
	
	
}
