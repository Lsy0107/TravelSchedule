package com.TravelSchedule.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.TravelSchedule.dto.Festival;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Service
public class ApiService {
	private final String Servicekey = "S7zgFEQqSlrWVhHdRtINMDDNv%2BTnaJrW2iEOUsm2Y5UdcfYh6inhqrsA1Qls%2BtLEub4iFJ4UT89YTfsFhZ0sZQ%3D%3D";

	public ArrayList<Festival> getFestival() throws Exception  {
		
		
		StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B551011/KorService1/searchFestival1"); /*URL*/
		urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=" + Servicekey); /*Service Key*/
		urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("50", "UTF-8")); /*한 페이지 결과 수*/
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
        	
        	FestList.add(festival);
        }
        System.out.println(FestList);
        
		return FestList;
	}

}
