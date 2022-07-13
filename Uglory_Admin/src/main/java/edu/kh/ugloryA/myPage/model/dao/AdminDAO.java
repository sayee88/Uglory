package edu.kh.ugloryA.myPage.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.ugloryA.myPage.model.vo.Admin;

@Repository
public class AdminDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/**
	 * 관리자 가입 DAO
	 * @param inputAdmin
	 * @return result
	 */
	public int signUp(Admin inputAdmin) {
		return sqlSession.insert("adminMapper.signUp", inputAdmin);
	}

	/**
	 * 로그인 DAO
	 * @param inputAdmin
	 * @return loginAdmin
	 */
	public Admin signIn(Admin inputAdmin) {
		return sqlSession.selectOne("adminMapper.signIn", inputAdmin);
	}
	
	/**
	 * 이메일 중복 검사 DAO
	 * @param adminEmail
	 * @return result
	 */
	public int emailDupCheck(String adminEmail) {
		return sqlSession.selectOne("adminMapper.emailDupCheck", adminEmail);
	}

}
