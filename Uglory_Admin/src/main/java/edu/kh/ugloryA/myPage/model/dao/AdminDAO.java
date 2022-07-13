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
	 * 회원가입 DAO
	 * @param inputAdmin
	 * @return result
	 */
	public int signUp(Admin inputAdmin) {
		return sqlSession.insert("adminMapper.signUp", inputAdmin);
	}

}
