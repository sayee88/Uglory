package edu.kh.ugloryA.myPage.model.service;

import java.io.File;
import java.io.IOException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import edu.kh.ugloryA.common.Util;
import edu.kh.ugloryA.myPage.model.dao.AdminDAO;
import edu.kh.ugloryA.myPage.model.vo.Admin;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDAO dao;
	
	//암호화를 위한 bcrypt 객체 의존성 주입
	@Autowired
	private BCryptPasswordEncoder bcrypt;

	//회원 가입 서비스 구현
	@Override
	public int signUp(Map<String, Object> map) throws IOException {
		
		Admin inputAdmin = (Admin)map.get("inputAdmin");
		
		//비밀번호 암호화
		String encPw = bcrypt.encode(inputAdmin.getAdminPw());
		inputAdmin.setAdminPw(encPw);
		
		//프로필 이미지 설정
		MultipartFile uploadImage = (MultipartFile)map.get("uploadImage");
		String renameImage = null;
		
		renameImage = Util.fileRename(uploadImage.getOriginalFilename());
		inputAdmin.setProfileImage( map.get("webPath") + renameImage);
		
		int result = dao.signUp(inputAdmin);
		
		//DB 수정 성공시 이미지를 서버에 저장
		if(result > 0 && inputAdmin.getProfileImage() != null) {
			uploadImage.transferTo( new File(map.get("folderPath") + renameImage) );
		}
		
		return result;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
