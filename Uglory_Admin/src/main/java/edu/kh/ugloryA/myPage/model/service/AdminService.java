package edu.kh.ugloryA.myPage.model.service;

import java.io.IOException;
import java.util.Map;

public interface AdminService {

	/**
	 * 회원 가입 Service
	 * @param map
	 * @return result
	 */
	int signUp(Map<String, Object> map) throws IOException;

}
