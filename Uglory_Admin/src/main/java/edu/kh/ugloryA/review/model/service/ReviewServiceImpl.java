package edu.kh.ugloryA.review.model.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.ugloryA.review.model.dao.ReviewDAO;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewDAO dao;
	
	private Logger logger = LoggerFactory.getLogger(ReviewServiceImpl.class);
	
}
