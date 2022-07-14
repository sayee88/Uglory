package edu.kh.ugloryA.farm.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.ugloryA.farm.model.dao.FarmDAO;

@Service
public class FarmServiceImpl implements FarmService {

	@Autowired
	private FarmDAO dao;
	
}
