package com.ship.util;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.ship.domain.Usr;
import com.ship.service.UsrService;

import lombok.extern.log4j.Log4j;

@Log4j
@Component
public class KakaoManager {
	@Autowired
	private UsrService usrService;
	
	//��Ż > ~~
	
	public Usr insertKakaoUsr(String code) throws Exception {
		String accessToken = getAccessToken(code);
		Usr kakaoUsr = getKakaoUserInfo(accessToken);
		log.info(" # kakaoUsr : "+kakaoUsr);
				
		
		boolean flag =  usrService.checkExistSocialUsrS(kakaoUsr); 
		Usr loginUsr = new Usr();
		if(flag) {
			//üũ�� ���̵� ������
			loginUsr = usrService.loginS(kakaoUsr);
			
		}else {
			//üũ�� ���̵� ������
			usrService.insertNewSNSUsrS(kakaoUsr);
			loginUsr = usrService.loginS(kakaoUsr);			
		}
		return loginUsr;
	}
	
	
	public String getAccessToken(String code) {
		
		String myKey = "4f7b60afb6a5f48d4ab9c342916ecfb2"; // # ������ �߱޹��� REST API KEY
		String myRedirectUrl="http://127.0.0.1:8080/user/kakao/callback"; // # ������ Redirect URI
		
		String accessToken = "";
		String refreshToken = "";
		String reqURL = "https://kauth.kakao.com/oauth/token"; // ���� code >> *url* >> accessToken .. ������.
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST"); // ��û�޼ҵ带 post�� ����..
			conn.setDoOutput(true); // OutputStream���� post �����͸� �Ѱ��ְڴ�..
			
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream())); // ������ �� ���� ������ü..
			StringBuilder postBox = new StringBuilder(); // StringBuilder�� ���� code�� �������� �׾Ƽ�
			postBox.append("grant_type=authorization_code");
			postBox.append("&client_id="+myKey); // ������ �߱޹��� key
			postBox.append("&redirect_uri="+myRedirectUrl); // ������ ������ �ּ�
			postBox.append("&code=" + code);
			bw.write(postBox.toString());
			bw.flush();
			
			int responseCode = conn.getResponseCode();
			log.info("\n # KaKaoServiceImpl.getAccessToken() responseCode  : " + responseCode + " ( 200 �߸� ���� )");

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";
			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println(" # KaKaoServiceImpl.getAccessToken() RequestBody : " + result );
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			
			accessToken = element.getAsJsonObject().get("access_token").getAsString();
			refreshToken = element.getAsJsonObject().get("refresh_token").getAsString();
			
			System.out.println(" # KaKaoServiceImpl.getAccessToken() accessToken : " + accessToken );
			System.out.println(" # KaKaoServiceImpl.getAccessToken() refreshToken : " + refreshToken +"\n");
			br.close();
			bw.close();
		} catch (IOException e) {
			log.info(" # KaKaoServiceImpl.getAccessToken() Exception e : " + e );
		}
		
		
		return accessToken;
	}


	
//	��Ż > ~~
	public Usr getKakaoUserInfo(String accessToken) throws Exception {

		String reqURL = "https://kapi.kakao.com/v2/user/me"; // ���� code >> url >> accessToken >> *url* >> RequestBody ..

		// accessToken�� �̿��Ͽ� ����� ���� ��ȸ
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-Type", "application/json;");
			conn.setDoOutput(true);
			conn.setRequestProperty("Authorization", "Bearer " + accessToken); // ������ header �ۼ�, accessToken����

			// ��� �ڵ尡 200�̶�� ����
			int responseCode = conn.getResponseCode();
			log.info("\n # KaKaoServiceImpl.getKakaoUserInfo() responseCode : " + responseCode + " ( 200 �߸� ���� )");

			// ��û�� ���� ���� JSONŸ���� Response �޼��� �о����..
			// InputStreamReader�� UTF-8 ��� �г��� �Ľ� ���� �Ф�..
			
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
			
			String line = "";
			String result = "";
			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println(" # KaKaoServiceImpl.getKakaoUserInfo() result : " + result );

			// Gson ���̺귯���� JSON�Ľ�
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);

			
			
			Usr kakaoUsr = new Usr();
			boolean hasEmail = element.getAsJsonObject().get("kakao_account").getAsJsonObject().get("has_email").getAsBoolean();

			if (hasEmail) {
				String usrId = element.getAsJsonObject().get("id").getAsString();
				System.out.println(" # KaKaoServiceImpl.getKakaoUserInfo() element.id : " + usrId );
				String usrEmail = element.getAsJsonObject().get("kakao_account").getAsJsonObject().get("email").getAsString();
				String usrNickname = element.getAsJsonObject().get("properties").getAsJsonObject().get("nickname").getAsString();
				String usrGender = element.getAsJsonObject().get("kakao_account").getAsJsonObject().get("gender").getAsString();				
				String usrPhotoPath = element.getAsJsonObject().get("properties").getAsJsonObject().get("profile_image").getAsString();
				String usrBirthday = "1900"+element.getAsJsonObject().get("kakao_account").getAsJsonObject().get("birthday").getAsString();
				System.out.println(" # KaKaoServiceImpl.getKakaoUserInfo() email : " + usrEmail + "\n");
				System.out.println(" # KaKaoServiceImpl.getKakaoUserInfo() usrBirth : " + usrBirthday + "\n");
				//usrBirth ��� ���� ?
				
				kakaoUsr = new Usr(usrId,usrEmail,usrNickname,usrGender,usrPhotoPath,"KAKAO");						
			}else {
				String usrId = element.getAsJsonObject().get("id").getAsString();
				System.out.println(" # KaKaoServiceImpl.getKakaoUserInfo() element.id : " + usrId );
				String usrEmail = "test@test.com";
				String usrNickname = element.getAsJsonObject().get("properties").getAsJsonObject().get("nickname").getAsString();
				String usrGender = element.getAsJsonObject().get("kakao_account").getAsJsonObject().get("gender").getAsString();				
				String usrPhotoPath = element.getAsJsonObject().get("properties").getAsJsonObject().get("profile_image").getAsString();
				String usrBirthday = "1900"+element.getAsJsonObject().get("kakao_account").getAsJsonObject().get("birthday").getAsString();
				System.out.println(" # KaKaoServiceImpl.getKakaoUserInfo() email : " + usrEmail + "\n");
				System.out.println(" # KaKaoServiceImpl.getKakaoUserInfo() usrBirth : " + usrBirthday + "\n");
				//usrBirth ��� ���� ?
				
				kakaoUsr = new Usr(usrId,usrEmail,usrNickname,usrGender,usrPhotoPath,"KAKAO");
			}
			br.close();
			
			return kakaoUsr;			

		} catch (IOException e) {
			log.info("# KaKaoServiceImpl.getKakaoUserInfo() Exception e : "+ e + "\n");			
			return null;
		}
	}
}
