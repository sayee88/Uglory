package edu.kh.ugloryA.common;

import java.text.SimpleDateFormat;
import java.util.HashMap;

import org.json.simple.JSONObject;

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

	
	public static void sendMessage() {
		
		String content = "";
		
		//메세지 보내기 예제
		
		String api_key = "NCSHMUJDRA5SEMJV";
	    String api_secret = "3BRDUZ0EWAXWXI7MUXPJBOTBN4LWOCZB";
	    Message coolsms = new Message(api_key, api_secret);

	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", "01053262570");	// 수신전화번호
	    params.put("from", "01053262570");	// 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
	    params.put("text", "첫번째 보내는 테스트 문자 메시지!");
	    params.put("type", "SMS");
	    //params.put("app_version", "test app 1.2"); // application name and version

	    try {
	        JSONObject obj = (JSONObject) coolsms.send(params);
	        System.out.println(obj.toString());
	      } catch (CoolsmsException e) {
	        System.out.println(e.getMessage());
	        System.out.println(e.getCode());
	      }      
	    
		//return content;
	}

}
