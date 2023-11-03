package com.TravelSchedule.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.TravelSchedule.dao.ApiDao;
import com.TravelSchedule.dto.Country;
import com.TravelSchedule.dto.Festival;
import com.TravelSchedule.dto.Likelist;
import com.TravelSchedule.dto.Review;
import com.TravelSchedule.dto.Tdest;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Service
public class ApiService {

	private final String Servicekey = "fnyC%2Fb4wNr6W9EaP84Tyac4BVyrteRBwti2mUVVQ5hLu%2F9a2YrkUHdCJVQjexkbJed8YUswpg2ZchXc0SB08Hw%3D%3D";
	@Autowired
	ApiDao apiDao;
	@Autowired
	ApiService apisvc;
	
	public ArrayList<Festival> getFestival() throws Exception  {
		
		
		StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B551011/KorService1/searchFestival1"); /*URL*/
		urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=" + Servicekey); /*Service Key*/
		urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("1000", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
        urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); /*	OS 구분 : IOS (아이폰), AND (안드로이드), WIN (윈도우폰), ETC(기타)*/
        urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8")); /*서비스명(어플명)*/
        urlBuilder.append("&" + URLEncoder.encode("_type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*응답메세지 형식 : REST방식의 URL호출 시 json값 추가(디폴트 응답메세지 형식은XML)*/
        urlBuilder.append("&" + URLEncoder.encode("listYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); /*목록구분(Y=목록, N=개수)*/
        urlBuilder.append("&" + URLEncoder.encode("arrange","UTF-8") + "=" + URLEncoder.encode("A", "UTF-8")); /*정렬구분 (A=제목순, C=수정일순, D=생성일순) 대표이미지가반드시있는정렬(O=제목순, Q=수정일순, R=생성일순)*/
        urlBuilder.append("&" + URLEncoder.encode("eventStartDate","UTF-8") + "=" + URLEncoder.encode("20231005", "UTF-8")); /*행사시작일(형식 :YYYYMMDD)*/
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        System.out.println(sb.toString());
        
        JsonObject Festival_Json = (JsonObject) JsonParser.parseString(sb.toString()); 
        System.out.println("[Festival_Json] "+Festival_Json);
        JsonArray FestivalList = Festival_Json.get("response").getAsJsonObject()
        		.get("body").getAsJsonObject()
        		.get("items").getAsJsonObject()
        		.get("item").getAsJsonArray();
        
        System.out.println("[FestivalList] "+FestivalList);
        
        JsonObject Festival_body = Festival_Json.get("response").getAsJsonObject().get("body").getAsJsonObject();
        
        JsonObject Festival_Items = Festival_body.get("items").getAsJsonObject();
        
        System.out.println("[Festival_body] "+Festival_body);
        System.out.println("[Festival_Items] "+Festival_Items);
        
//        JsonArray itemList = Festival_body.get("item").getAsJsonArray();
//        System.out.println("[itemList] "+itemList);
//        
//        System.out.println("[itemList.size()] "+itemList.size());
        
        ArrayList<Festival> FestList = new ArrayList<Festival>();
        for(int i=0; i<FestivalList.size(); i++) {
        	Festival festival = new Festival();
        	String feaddress = FestivalList.get(i).getAsJsonObject().get("addr1").getAsString();
        	String feaddress2 = FestivalList.get(i).getAsJsonObject().get("addr2").getAsString();
        	festival.setFeaddress(feaddress + " " + feaddress2);
        	
        	String feposter = FestivalList.get(i).getAsJsonObject().get("firstimage").getAsString();
        	festival.setFeposter(feposter);
        	
        	String fename = FestivalList.get(i).getAsJsonObject().get("title").getAsString();
        	festival.setFename(fename);
        	
        	String opendate = FestivalList.get(i).getAsJsonObject().get("eventstartdate").getAsString();
        	festival.setOpendate(opendate);
        	
        	String enddate = FestivalList.get(i).getAsJsonObject().get("eventenddate").getAsString();
        	festival.setEnddate(enddate);
        	
        	String fetel = FestivalList.get(i).getAsJsonObject().get("tel").getAsString();
        	festival.setFetel(fetel);
        	
        	String felati = FestivalList.get(i).getAsJsonObject().get("mapx").getAsString();
        	festival.setFelati(felati);
        	
        	String felongti = FestivalList.get(i).getAsJsonObject().get("mapy").getAsString();
        	festival.setFelongti(felongti);
        	
        	String contentid = FestivalList.get(i).getAsJsonObject().get("contentid").getAsString();
        	festival.setContentid(contentid);
        	
        	Festival feDetail = apisvc.getDetail_Fe(contentid, festival);
        	
        	
        	
        	String ctname = feaddress.split(" ")[0];
        	switch(ctname) {
        	case "전북":
        		ctname = "전라북도";
        		break;
        	case "전남":
        		ctname = "전라남도";
        		break;
        	case "경북":
        		ctname = "경상북도";
        		break;
        	case "경남":
        		ctname = "경상남도";
        		break;
        	case "충북":
        		ctname = "충청북도";
        		break;
        	case "충남":
        		ctname = "충청남도";
        		break;
        	case "강원도":
        		ctname = "강원특별자치도";
        		break;
        	case "제주도":
        		ctname = "제주특별자치도";
        		break;
        		
        	}        	
        	
        	String ctcode = apiDao.selectCtcode(ctname);
        	System.out.println(ctcode + " " + feaddress);
        	
        	String fecode = apiDao.maxcode("festival");
			String codeName = fecode.substring(0,2);
			int codeNum = Integer.parseInt(fecode.substring(2))+1;
			String codeNum_String = String.format("%05d", codeNum);
			fecode = codeName + codeNum_String;
			
        	System.out.println(fecode);
        	festival.setCtcode(ctcode);
        	festival.setFecode(fecode);
        	FestList.add(festival);
        	
        	
        	
        	String rs = apiDao.selectFecode(fename);
			if(rs.equals("Y")) {				
				apiDao.insertFestival(festival);				
			}
        }
        System.out.println(FestList);
        
		return FestList;
	}

	private Festival getDetail_Fe(String contentid, Festival festival) throws Exception {
		
		StringBuilder urlBuilder = new StringBuilder("https://apis.data.go.kr/B551011/KorService1/detailCommon1"); /*URL*/
		urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=" + Servicekey); /*Service Key*/
		urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
        urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); /*	OS 구분 : IOS (아이폰), AND (안드로이드), WIN (윈도우폰), ETC(기타)*/
        urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8")); /*서비스명(어플명)*/
        urlBuilder.append("&" + URLEncoder.encode("_type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*응답메세지 형식 : REST방식의 URL호출 시 json값 추가(디폴트 응답메세지 형식은XML)*/
        urlBuilder.append("&" + URLEncoder.encode("contentId","UTF-8") + "=" + URLEncoder.encode(contentid, "UTF-8")); /*목록구분(Y=목록, N=개수)*/
        urlBuilder.append("&" + URLEncoder.encode("contentTypeId","UTF-8") + "=" + URLEncoder.encode("15", "UTF-8")); /*정렬구분 (A=제목순, C=수정일순, D=생성일순) 대표이미지가반드시있는정렬(O=제목순, Q=수정일순, R=생성일순)*/
        urlBuilder.append("&" + URLEncoder.encode("defaultYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("firstImageYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("areacodeYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("catcodeYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("addrinfoYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("mapinfoYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("overviewYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8"));
        
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        System.out.println(sb.toString());
        
        JsonObject Festival_Json = (JsonObject) JsonParser.parseString(sb.toString()); 
        System.out.println("[Festival_Json] "+Festival_Json);
        JsonArray FestivalList = Festival_Json.get("response").getAsJsonObject()
        		.get("body").getAsJsonObject()
        		.get("items").getAsJsonObject()
        		.get("item").getAsJsonArray();
        
        System.out.println("[FestivalList] "+FestivalList);
        
        JsonObject Festival_body = Festival_Json.get("response").getAsJsonObject().get("body").getAsJsonObject();
        
        JsonObject Festival_Items = Festival_body.get("items").getAsJsonObject();
        
        System.out.println("[Festival_body] "+Festival_body);
        System.out.println("[Festival_Items] "+Festival_Items);
        
//        JsonArray itemList = Festival_body.get("item").getAsJsonArray();
//        System.out.println("[itemList] "+itemList);
//        
//        System.out.println("[itemList.size()] "+itemList.size());
        
        String feinfo = FestivalList.get(0).getAsJsonObject().get("overview").getAsString();        
        if(feinfo.length() > 1500) {
        	feinfo = "설명은 홈페이지 참조 바람";
        }
        festival.setFeinfo(feinfo);	
        String homepage = FestivalList.get(0).getAsJsonObject().get("homepage").getAsString();        
        if(!homepage.equals("")) {
        	String homepage1 = homepage.split( "\"" )[1];        
        	festival.setHomepage(homepage1);
        } else {
        	festival.setHomepage(homepage);        	        	
        }
        System.out.println(festival);
		return festival;
	}

	public ArrayList<Tdest> getTdestList() throws Exception {
		ArrayList<Tdest> TdestList = new ArrayList<Tdest>();
		String[] areaNum = { "39" };
		for(int j=0; j <= areaNum.length; j++) {
			
		
		StringBuilder urlBuilder = new StringBuilder(
				"https://apis.data.go.kr/B551011/KorService1/areaBasedList1"); /* URL */
		urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=" + Servicekey); /* Service Key */
		urlBuilder.append(
				"&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /* 페이지 번호 */
		urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "="
				+ URLEncoder.encode("500", "UTF-8")); /* 한 페이지 결과 수 */
		urlBuilder.append("&" + URLEncoder.encode("MobileOS", "UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8"));
		urlBuilder.append(
				"&" + URLEncoder.encode("MobileApp", "UTF-8") + "=" + URLEncoder.encode("TravelSchedule", "UTF-8"));
		urlBuilder.append(
				"&" + URLEncoder.encode("_type", "UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /* XML/JSON 여부 */		
		urlBuilder.append(
				"&" + URLEncoder.encode("areaCode", "UTF-8") + "=" + URLEncoder.encode(areaNum[j], "UTF-8")); /* 지역코드 */
		
		urlBuilder.append("&" + URLEncoder.encode("contentTypeId", "UTF-8") + "=" + URLEncoder.encode("12", "UTF-8"));

		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		System.out.println("Response code: " + conn.getResponseCode());
		BufferedReader rd;
		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			sb.append(line);
		}
		rd.close();
		conn.disconnect();
//		System.out.println(sb.toString());

		// json 변환
		JsonObject DestInfo = (JsonObject) JsonParser.parseString(sb.toString());
//		System.out.println("[DestInfo] : " + DestInfo);

		JsonArray infoList = DestInfo.get("response").getAsJsonObject().get("body").getAsJsonObject().get("items")
				.getAsJsonObject().get("item").getAsJsonArray();
		
//		System.out.println("[infoList] : " + infoList);

		JsonObject DestInfo_Body = DestInfo.get("response").getAsJsonObject().get("body").getAsJsonObject();

		JsonObject DestInfo_Items = DestInfo_Body.get("items").getAsJsonObject();

//		System.out.println("[DestInfo_Body] : " + DestInfo_Body);
//		System.out.println("[DestInfo_Itmes] : " + DestInfo_Items);

//	        JsonArray itemList = DestInfo_Items.get("item").getAsJsonArray();

//	        System.out.println("[itemList] : "+itemList);
//	        System.out.println("[tiemList.size] : "+itemList.size());

		
		for (int i = 0; i < infoList.size(); i++) {
			Tdest tdest = new Tdest();
			String tdname = infoList.get(i).getAsJsonObject().get("title").getAsString();
			

			String addr1 = infoList.get(i).getAsJsonObject().get("addr1").getAsString();
			String ctcode = apiDao.selectCtcode(addr1.split(" ")[0]);	
			if(ctcode.equals("CT00000")) {
				/*
				ctcode = apiDao.maxcode("country", addr1);
				String codeName = ctcode.substring(0,2);
				int codeNum = Integer.parseInt(ctcode.substring(2))+1;
				System.out.println("codeName : "+codeName + " codeNum : "+codeNum);
				String codeNum_String = String.format("%05d", codeNum);
				ctcode = codeName + codeNum_String;
				System.out.println(ctcode);
				 * */
				continue;
			}
			System.out.println(DestInfo_Items);
			String tdcode = apiDao.maxcode("tdest");
			String codeName = tdcode.substring(0,2);
			int codeNum = Integer.parseInt(tdcode.substring(2))+1;
			String codeNum_String = String.format("%05d", codeNum);
			tdcode = codeName + codeNum_String;
			
			tdest.setTdcode(tdcode);
			tdest.setTdname(tdname);
			tdest.setCtcode(ctcode);
			String addr2 = infoList.get(i).getAsJsonObject().get("addr2").getAsString();
			String tdaddress = addr1 + addr2;
			tdest.setTdaddress(tdaddress);
			String tdlati = infoList.get(i).getAsJsonObject().get("mapx").getAsString();
			tdest.setTdlati(tdlati);
			String tdlongti = infoList.get(i).getAsJsonObject().get("mapy").getAsString();
			tdest.setTdlongti(tdlongti);
			String tdphoto = infoList.get(i).getAsJsonObject().get("firstimage").getAsString();
			tdest.setTdphoto(tdphoto);
			String contentid = infoList.get(i).getAsJsonObject().get("contentid").getAsString();
			tdest.setContentid(contentid);
			String tdtel = infoList.get(i).getAsJsonObject().get("tel").getAsString();
        	tdest.setTdtel(tdtel);
			System.out.println(contentid);
			try {
				Tdest tdDetail = apisvc.getDetail_Td(contentid, tdest);
			} catch (Exception e) {
				continue;
			}
			
			String rs = apiDao.selectTdcode(tdname);
			
			if(rs.equals("Y")) {				
				apiDao.insertTdest(tdest);				
			}
			TdestList.add(tdest);
			System.out.println(tdest);
		}
		}
	//	System.out.println(TdestList);
		return TdestList;
	}

	private Tdest getDetail_Td(String contentid, Tdest tdest) throws Exception{
		StringBuilder urlBuilder = new StringBuilder("https://apis.data.go.kr/B551011/KorService1/detailCommon1"); /*URL*/
		urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=" + Servicekey); /*Service Key*/
		urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
        urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); /*	OS 구분 : IOS (아이폰), AND (안드로이드), WIN (윈도우폰), ETC(기타)*/
        urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8")); 
        urlBuilder.append("&" + URLEncoder.encode("_type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); 
        urlBuilder.append("&" + URLEncoder.encode("contentId","UTF-8") + "=" + URLEncoder.encode(contentid, "UTF-8")); 
        urlBuilder.append("&" + URLEncoder.encode("contentTypeId","UTF-8") + "=" + URLEncoder.encode("12", "UTF-8")); 
        urlBuilder.append("&" + URLEncoder.encode("defaultYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("firstImageYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("areacodeYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("catcodeYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("addrinfoYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("mapinfoYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("overviewYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8"));
        
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        System.out.println(sb.toString());
        
        JsonObject Tdest_Json = (JsonObject) JsonParser.parseString(sb.toString()); 
        System.out.println("[Festival_Json] "+Tdest_Json);
        JsonArray TdestList = Tdest_Json.get("response").getAsJsonObject()
        		.get("body").getAsJsonObject()
        		.get("items").getAsJsonObject()
        		.get("item").getAsJsonArray();
        
        System.out.println("[FestivalList] "+TdestList);
        
        JsonObject Festival_body = Tdest_Json.get("response").getAsJsonObject().get("body").getAsJsonObject();
        
        JsonObject Festival_Items = Festival_body.get("items").getAsJsonObject();
        
        System.out.println("[Festival_body] "+Festival_body);
        System.out.println("[Festival_Items] "+Festival_Items);
        
//        JsonArray itemList = Festival_body.get("item").getAsJsonArray();
//        System.out.println("[itemList] "+itemList);
//        
//        System.out.println("[itemList.size()] "+itemList.size());
        
        String tdinfo = TdestList.get(0).getAsJsonObject().get("overview").getAsString();        
        if(tdinfo.length() > 1500) {
        	tdinfo = "설명은 홈페이지 참조 바람";
        }
        tdest.setTdinfo(tdinfo);	
        String homepage = TdestList.get(0).getAsJsonObject().get("homepage").getAsString();        
        
        	String[] split_arr = homepage.split( "\"" );
        	if(split_arr.length >= 2) {
        		String homepage1 = split_arr [1];        
        		tdest.setHomepage(homepage1);
        		
        	}
         else {
        	tdest.setHomepage("");        	        	
        }
        System.out.println(tdest);
		return tdest;
	}

	public ArrayList<Tdest> getTdList() {
		System.out.println("ApiService - getTdList()");
		return apiDao.selectTdest();
	}

	public ArrayList<Festival> getFeList() {
		System.out.println("ApiService - getFeList()");
		return apiDao.selectFestival();
	}

	
	public String weatherApi() throws IOException {
		StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1360000/MidFcstInfoService/getMidLandFcst"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=fnyC%2Fb4wNr6W9EaP84Tyac4BVyrteRBwti2mUVVQ5hLu%2F9a2YrkUHdCJVQjexkbJed8YUswpg2ZchXc0SB08Hw%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("dataType","UTF-8") + "=" + URLEncoder.encode("JSON", "UTF-8")); /*요청자료형식(XML/JSON)Default: XML*/
        urlBuilder.append("&" + URLEncoder.encode("regId","UTF-8") + "=" + URLEncoder.encode("11B00000", "UTF-8")); /*11B0000 서울, 인천, 경기도 11D10000 등 (활용가이드 하단 참고자료 참조)*/
        urlBuilder.append("&" + URLEncoder.encode("tmFc","UTF-8") + "=" + URLEncoder.encode("202310051800", "UTF-8")); /*-일 2회(06:00,18:00)회 생성 되며 발표시각을 입력 YYYYMMDD0600(1800)-최근 24시간 자료만 제공*/
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        System.out.println(sb.toString());
        
        
		return null;
	}
	public ArrayList<Country> getCountry() {
		System.out.println("ApiService - getCountry()");
		return apiDao.selectCountry();
	}

	public ArrayList<Festival> festival_country(String ctcode) {
		System.out.println("ApiService - festival_country()");
		return apiDao.selectFestival_country(ctcode);
	}

	public ArrayList<Festival> getFestival_db() {
		System.out.println("ApiService - getFestival_db()");
		return apiDao.selectFestival_db();
	}

	public Festival detailFestival(String code) {
		System.out.println("ApiService - detailFestival()");
		return apiDao.selectFestival_detail(code);
	}

	public ArrayList<Festival> festival_Nearby(String ctcode, String fecode) {
		System.out.println("ApiService - festival_Nearby");
		return apiDao.selectFestival_Nearby(ctcode, fecode);
	}

	public String getCountry_this(String ctcode) {
		System.out.println("ApiService - getCountry_this()");
		return apiDao.selectCountry_this(ctcode);
	}

	public ArrayList<Festival> SearchFestivalList(String searchVal) {
		System.out.println("ApiService - SearchFestivalList()");
		return apiDao.selectSearchFestival(searchVal);
	}

	public String getLkcode(Likelist lk) {
		System.out.println("ApiService - getLkcode()");
		String lkcode = apiDao.maxcode_lk();
		if(lkcode.equals("LK00000")) {
		lkcode = "LK00001";	
		}else {
			
		String codeName = lkcode.substring(0,2);
		int codeNum = Integer.parseInt(lkcode.substring(2))+1;
		String codeNum_String = String.format("%05d", codeNum);
		lkcode = codeName + codeNum_String;
		}
		System.out.println(lkcode);
		
		return lkcode;
	}

	public String getLikelist(Likelist lk, String seloption) {
		System.out.println("ApiService - getLikelist()");
		Likelist result = apiDao.selectLK(lk, seloption);
		if(result == null) {
			return "N";
		} else {
			return "Y";
		}
	}

	public int insertLk(Likelist lk, String seloption) {
		System.out.println("ApiService - insertLK()");
		
		return apiDao.insertLK(lk, seloption);
	}

	public int deleteLk(Likelist lk, String seloption) {
		// TODO Auto-generated method stub
		return apiDao.deleteLK(lk, seloption);
	}

	public ArrayList<HashMap<String, String>> reList() {
		
		ArrayList<HashMap<String, String>> reListDao = apiDao.reListDao();
		return reListDao;
	}

	public Review getRe(String cs) {
		
		Review getReDao = apiDao.getReDao(cs);
		return getReDao;
	}

	public ArrayList<Likelist> likeList_td(String mid) {
		
		return apiDao.selectlikeList_td(mid);
	}

	public Tdest getTdest(String tdcode) {

		return apiDao.selectTd(tdcode);
	}

	public ArrayList<Likelist> likeList_fe(String mid) {

		return apiDao.selectlikeList_fe(mid);
	}

	public Festival getFe(String fecode) {
	
		return apiDao.selectFe(fecode);
	}

	public ArrayList<Likelist> likeList_re(String mid) {
		
		return apiDao.selectlikeList_re(mid);
	}

	public Review getReview(String recode) {
		
		return apiDao.selectReview(recode);
	}


}
