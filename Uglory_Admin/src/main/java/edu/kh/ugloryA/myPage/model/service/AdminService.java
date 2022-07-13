package edu.kh.ugloryA.myPage.model.service;

import java.io.IOException;
import java.util.Map;

import edu.kh.ugloryA.myPage.model.vo.Admin;

public interface AdminService {

	/**
	 * 관리자 가입 Service
	 * @param map
	 * @return result
	 */
	int signUp(Map<String, Object> map) throws IOException;

	/**
	 * 로그인 Service
	 * @param inputAdmin
	 * @return loginAdmin
	 */
	Admin signIn(Admin inputAdmin);

	/**
	 * 이메일 중복 검사 Service
	 * @param adminEmail
	 * @return result
	 */
	int emailDupCheck(String adminEmail);

}
