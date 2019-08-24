package com.spring.weather.login.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Service
public class KakaoService {
	
	private static final String APP_KEY="50b8e1c81358ae721c7cad0e071da402";
	private static final String REDIRECT_URI="http://qwerasdf9.cafe24.com/kakaoLogin";
	
		
	public String getAccessToken(String code) throws Exception{
		
		String accessToken = "";
		String reqURL ="https://kauth.kakao.com/oauth/token";
		
		BufferedWriter bw = null;
		BufferedReader br = null;
		
		try {
			//자바 코드를 서버에 요청을 보내는 URL객체 생성
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection)url.openConnection(); //해당 url로 서버연결을 하기위한 객체
			
			conn.setRequestMethod("POST");
			conn.setDoOutput(true); //POST요청시에는 setDoOutPut메서드의 매개값을 true로 전달
			
			//POST요청에 필요한 파라미터를 파일스트림을 통해 전달.
			//BufferWriter는 보조스트림이기 떄문에 메인 스트림 객체가 필요함
			bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			
			String param="";
			param += "grant_type=authorization_code"
					+"&client_id="+APP_KEY
					+"&redirect_uri="+REDIRECT_URI
					+"&code="+code;
			
			bw.write(param); //출력버퍼를 통해 문자데이터 전송 
			bw.flush();	//출력버퍼를 비우는 코드
			
			
			// 요청이 성공했다면 HTTP Status가 200번으로 응답됨.
			int resCode = conn.getResponseCode();
			System.out.println("response status: "+ resCode);
			
			//응답된 JSONㅁ데이터 문자열로 읽기
			br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			
			//JSON데이터를 줄단위로 로딩. 
			String line="";
			String result="";
			while((line = br.readLine()) != null) {
				result +=line;
			}
			System.out.println("결과 데이터 : "+result);
			
			//result데이터를 JSON으로 파싱 
			JsonParser jParser = new JsonParser();
			JsonElement element = jParser.parse(result);
			
			
			accessToken = element.getAsJsonObject().get("access_token").getAsString();
			System.out.println("accessToken: "+accessToken);
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			br.close(); bw.close();
		}
		
		return accessToken;
	}
	
	//카카오 로그인 사용자 정보 요청 메서드 
	public Map<String, Object> getKakaoUserData(String accessToken) throws Exception{
		
		
		Map<String, Object> userData = new HashMap<>();
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		
		BufferedReader br = null;
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection)url.openConnection(); //해당 url로 서버연결을 하기위한 객체
			
			conn.setRequestMethod("GET");
			
			conn.setRequestProperty("Authorization", "Bearer "+accessToken);
			
			// 요청이 성공했다면 HTTP Status가 200번으로 응답됨.
			int resCode = conn.getResponseCode();
			System.out.println("userData Req -> response status: "+ resCode);
						
			
			
			//응답된 JSONㅁ데이터 문자열로 읽기
			br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			
			//JSON데이터를 줄단위로 로딩. 
			String line="";
			String result="";
			while((line = br.readLine()) != null) {
				result +=line;
			}
			System.out.println("결과 데이터 : "+result);
			
			//result데이터를 JSON으로 파싱 
			JsonParser jParser = new JsonParser();
			JsonElement element = jParser.parse(result);
			
			JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
			JsonObject kakaoAccount = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

			String nickname = properties.get("nickname").getAsString();
			String profileImagePath = properties.get("profile_image").getAsString();
			String email = kakaoAccount.get("email").getAsString();
			
			userData.put("nickname", nickname);
			userData.put("profileImagePath", profileImagePath);
			userData.put("email", email);
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			
		}
		return userData;
	}
	
	//로그아웃 처리 
	public void kakaoLogout(String accessToken) {
	       String reqURL = "https://kapi.kakao.com/v1/user/logout";
	       try {
	           URL url = new URL(reqURL);
	           HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	           conn.setRequestMethod("POST");
	           conn.setRequestProperty("Authorization", "Bearer " + accessToken);
	           
	           int responseCode = conn.getResponseCode();
	           System.out.println("responseCode : " + responseCode);
	           
	           BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	           
	           String result = "";
	           String line = "";
	           
	           while ((line = br.readLine()) != null) {
	               result += line;
	           }
	           System.out.println(result);
	       } catch (Exception e) {
	           e.printStackTrace();
	       }
	   }
}
