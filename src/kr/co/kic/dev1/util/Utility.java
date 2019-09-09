package kr.co.kic.dev1.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class Utility {

	public static String getConvert(String msg) {
		msg = msg.replaceAll(">","&gt").replaceAll("<", "&lt;").replaceAll("\n","<br>");
		return msg;
	}
	

//--------------------------------------------------------------------------------------------
	public static String getKoreanDate(String date) { //Aug 05,2019
		String koreanDate = null;
		SimpleDateFormat from = new SimpleDateFormat("MMM dd,yyyy",Locale.US);
		SimpleDateFormat to = new SimpleDateFormat("yyyy-MM-dd",Locale.KOREAN);
	
	
		try {
			Date d = from.parse(date);  //date=> Aug 05,2019
			koreanDate = to.format(d);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return koreanDate; //2019-08-05
	}

//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	
	public static String getShortenURL(String id, String secret, String oriUrl) {

		String clientId = id;// 애플리케이션 클라이언트 아이디값";
		String clientSecret = secret; // 애플리케이션 클라이언트 시크릿값";
		StringBuffer resp = new StringBuffer();
		try {
			String text = oriUrl;
			String apiURL = "https://openapi.naver.com/v1/util/shorturl?url=" + text;
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("X-Naver-Client-Id", clientId);
			con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			while ((inputLine = br.readLine()) != null) {
				resp.append(inputLine + "\n");
			}
			br.close();
			//System.out.println(response.toString());

			JSONParser jsonParse = new JSONParser();
			JSONObject jsonObj = (JSONObject) jsonParse.parse(resp.toString());
			JSONObject dataObject = (JSONObject) jsonObj.get("result");
			resp.setLength(0); // StringBuffer에 저장된 문자열 모두 지우기
			resp.append((String) dataObject.get("url")); // key갑의 value찾기 ( ~~.get("가져올 값의 key"));

		} catch (Exception e) {
			System.out.println(e);
		}
		return resp.toString();
	}
	
}
