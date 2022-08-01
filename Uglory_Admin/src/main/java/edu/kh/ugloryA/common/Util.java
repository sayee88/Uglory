package edu.kh.ugloryA.common;

import java.text.SimpleDateFormat;
import java.util.HashMap;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

public class Util {
	
	// 파일명 변경 메소드
	public static String fileRename(String originFileName) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String date = sdf.format(new java.util.Date(System.currentTimeMillis()));
	
		int ranNum = (int) (Math.random() * 100000); // 5자리 랜덤 숫자 생성
	
		String str = "_" + String.format("%05d", ranNum);
	
		String ext = originFileName.substring(originFileName.lastIndexOf("."));
	
		return date + str + ext;
	}

	
	public static int sendMessage(String text, String memberPhone) {
		
		int result = 0;
		
		Logger logger = LoggerFactory.getLogger(Util.class);
		
		//메세지 보내기 예제
		String api_key = "";
	    String api_secret = "";
	    Message coolsms = new Message(api_key, api_secret);
	    

	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", memberPhone);	// 수신전화번호
	    params.put("from", "01053262570");	// 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
	    params.put("text", text);
	    params.put("type", "LMS");
	    //params.put("app_version", "test app 1.2"); // application name and version

	    try {
	        JSONObject obj = (JSONObject) coolsms.send(params);
	        logger.info(obj.toString());
	        result = Integer.parseInt(obj.get("success_count").toString());
	        
	      } catch (CoolsmsException e) {
	    	logger.info(e.getMessage());
	    	logger.info( Integer.toString(e.getCode()) );
	      }
	    
	    return result;
	}

}
