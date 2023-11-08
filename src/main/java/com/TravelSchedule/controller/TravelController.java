package com.TravelSchedule.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.TravelSchedule.dto.Calendar;
import com.TravelSchedule.dto.Country;
import com.TravelSchedule.dto.Festival;
import com.TravelSchedule.dto.Likelist;
import com.TravelSchedule.dto.Schedule;
import com.TravelSchedule.dto.Tdest;
import com.TravelSchedule.service.ApiService;
import com.TravelSchedule.service.TravelService;
import com.google.gson.Gson;

@Controller
public class TravelController {

	@Autowired
	TravelService tsvc;

	@Autowired
	ApiService apisvc;
	
	@RequestMapping(value="/sreachPreview",produces="application/json;charset=UTF-8")
	public @ResponseBody String sreachPreview(String searchInfo, String seloption) {
		System.out.println("검색어 미리보기");
		System.out.println(seloption);
		ArrayList<HashMap<String, String>> previewList = tsvc.getPreview(searchInfo, seloption);
		System.out.println(previewList);
		return new Gson().toJson(previewList);
	}
	
	@RequestMapping(value="/removeDest")
	public @ResponseBody String removeDest(Schedule sc, String seloption){
		System.out.println("캘린더 개획 삭제");
		int rs = tsvc.removeDest(sc, seloption);
		String result = "N";
		if(rs>0) {
			result = "Y";
		}
		return result;
	}
	
	@RequestMapping(value="/removeCalendar")
	public @ResponseBody boolean removeCalendar(Calendar cd) {
		System.out.println("캘린더 삭제하기");
		ArrayList<Schedule> scList = tsvc.checkSchedule(cd);
		System.out.println(scList.size());
		int resc = 1;
		
		boolean rs = false;
		if(scList.size() != 0) {
			resc = tsvc.removeSchedule(cd);
			System.out.println(resc);
			if(resc>0) {
				int recd = tsvc.removeCalendar(cd);
				if(recd>0) {
					rs = true;
					System.out.println(recd);
				}
			}
		}else {
			int recd = tsvc.removeCalendar(cd);
			if(recd>0) {
				rs = true;
				System.out.println(recd);
			}
		}
		return rs;
	}
	
	@RequestMapping(value="/updateCdstate")
	public @ResponseBody String updateCdstate(String cdcode, HttpSession session) {
		System.out.println("계획 확정하기");
		String mid = (String)session.getAttribute("loginId");
		System.out.println(cdcode);
		Calendar cd = new Calendar();
		cd.setCdcode(cdcode);
		cd.setMid(mid);
		ArrayList<Schedule> scList = tsvc.checkSchedule(cd);
		String result = "N";
		if(scList.size() >0) {	
			System.out.println(scList);
			if(scList.get(0).getScdate()!=null) {
				System.out.println("asd");
				int rs = tsvc.updateCdstate(cdcode, mid);
				if(rs>0 ) {
					result = "Y";					
				}else {
					result="C";					
				}
			}
		}
		return result;
	}
	
	@RequestMapping(value = "/updateSc")
	public @ResponseBody String updateSc(Schedule sc, String seloption) {
		System.out.println("스케쥴 등록하기");
		int rs = tsvc.updateSc(sc, seloption);
		return null;
	}

	@RequestMapping(value = "/getSchedule", produces = "application/text; charset=utf8")
	public @ResponseBody String getSchedule(String cdcode, String mid) {
		System.out.println("달력 선택 페이지 스케쥴 가져오기");
		System.out.println(cdcode + mid);
		ArrayList<HashMap<String, String>> scList = tsvc.select_sc_td_join(mid, cdcode);
		return new Gson().toJson(scList);
	}

	@RequestMapping(value = "/travelSc")
	public ModelAndView travelMkSc(String cdcode, HttpSession session) {
		System.out.println("여행 계획 페이지 이동");
		ModelAndView mav = new ModelAndView();
		String mid = (String) session.getAttribute("loginId");
		Calendar cd = tsvc.getCalendar(mid, cdcode);
		ArrayList<HashMap<String, String>> sctdList = tsvc.select_sc_td_join(mid, cdcode);
		ArrayList<HashMap<String, String>> lalngList = new ArrayList<HashMap<String, String>>();
		for (HashMap<String, String> sctd : sctdList) {
			if (!sctd.containsKey("SCDATE")) {
				continue;
			}
			HashMap<String, String> lalng = new HashMap<String, String>();
			if (sctd.containsKey("TDCODE")) {
				lalng.put("lati", sctd.get("TDLONGTI"));
				lalng.put("longti", sctd.get("TDLATI"));
				lalng.put("name", sctd.get("TDNAME"));
				lalng.put("code", sctd.get("TDCODE"));
			} else {
				lalng.put("lati", sctd.get("FELONGTI"));
				lalng.put("longti", sctd.get("FELATI"));
				lalng.put("name", sctd.get("FENAME"));
				lalng.put("code", sctd.get("FECODE"));
			}
			lalng.put("scdate", sctd.get("SCDATE"));
			lalngList.add(lalng);
		}
		mav.addObject("cd",cd);
		mav.addObject("scdestList", sctdList);
		mav.addObject("lalngList", new Gson().toJson(lalngList));
		mav.setViewName("/travel/TravelSchedule");
		return mav;
	}

	@RequestMapping(value = "/registSelectDest")
	public @ResponseBody String registSelectDest(Schedule sc, String seloption) {
		System.out.println("여행지 선택");
		System.out.println(sc);
		System.out.println(seloption);
		Schedule checksc = tsvc.getSchedule(sc, seloption);
		String response = "Y";
		if (checksc == null) {
			int rs = tsvc.registSelectDest(sc, seloption);
			if (rs <= 0) {
				response = "N";
			}
		} else {
			response = "N";
		}
		return response;
	}

	@RequestMapping(value = "/selectCalendar")
	public ModelAndView selectCalendar(HttpSession session) {
		System.out.println("달력 선택 페이지");
		ModelAndView mav = new ModelAndView();
		String mid = (String) session.getAttribute("loginId");
		ArrayList<Calendar> cdList = tsvc.getCalendar(mid);
		mav.addObject("cdList", cdList);
		mav.setViewName("/travel/SelectCalendar");
		return mav;

	}

	@RequestMapping(value = "/registCalendar")
	public @ResponseBody String registCalendar(Calendar cd) {
		System.out.println("달력 만들기");
		int rs = tsvc.registCalendar(cd);
		String result = "";
		if (rs > 0) {
			result = "Y";
		} else {
			result = "N";
		}
		return result;
	}

	@RequestMapping(value = "/getCdcode")
	public @ResponseBody ArrayList<Calendar> getCdcode(String mid) {
		System.out.println("cdcode 가져오기");
		return tsvc.getCdcode(mid);
	}
	
	@RequestMapping(value="/detailTdest")
	public ModelAndView detailTdest(String tdcode, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		System.out.println(tdcode);
		if(session.getAttribute("loginId") != null) {
			Likelist lk = new Likelist();
			lk.setTdcode(tdcode);		
			lk.setMid((String)session.getAttribute("loginId"));
			System.out.println(lk.getMid());
			String seloption = "tdest";
			//System.out.println(codeName);
			String Like = apisvc.getLikelist(lk, seloption);
			mav.addObject("like", Like);
		}
		System.out.println("여행지 상세 정보 페이지이동");
		System.out.println("TDCODE : "+tdcode);
		Tdest detailTdest = tsvc.detailTdest(tdcode);
		String ctcode = detailTdest.getCtcode();
		System.out.println(detailTdest);
		ArrayList<Tdest> Nearby = tsvc.tdest_Nearby(ctcode, tdcode);
		String country = apisvc.getCountry_this(ctcode);
		ArrayList<Festival> festival = apisvc.getFestival_db();
		
		//System.out.println("키값 : "+codeList);
		
		ArrayList<HashMap<String,String>> ReList = new ArrayList<>();
		
		ArrayList<HashMap<String,String>> reList = apisvc.reList();
		for(HashMap<String, String> re : reList) {
			String codeList = (String)re.get("CODELIST");
			String[] codeSplit = codeList.split("/");
			for(String cs : codeSplit) { //cs => codeList를 /로 나눈 코드들
				System.out.println(cs);
				if(cs.contains(tdcode)) {
					ReList.add(re);
				}			
			}
			
		}
		
		
		
		System.out.println("리뷰리스트"+ReList);
		mav.addObject("Re",ReList);
		mav.addObject("country",country);
		mav.addObject("detailTd",detailTdest);
		mav.addObject("nearby", Nearby);		
		mav.addObject("festival", festival);
		
		mav.setViewName("/travel/detailTdest");
		
		return mav;
	}
	
	//여행지 + 축제 페이지
	@RequestMapping(value="TravelSearch")
	public @ResponseBody String TravelSearch(String category,String ctcode) { //ctcode => 도시 이름
		ModelAndView mav = new ModelAndView();
		System.out.println("받아온 도시 : "+ctcode); //도시 이름 자체로 가져옴
		System.out.println("받아온 카테고리 : "+category);
		
		String getctcode = tsvc.getctcode(ctcode);
		System.out.println(getctcode);
		ArrayList<Tdest> TravelSearch = tsvc.TravelSearch(getctcode,category);

			
		return new Gson().toJson(TravelSearch);
	}
	@RequestMapping(value="FestSearch")
	public @ResponseBody String FestSearch(String category,String ctcode) {
		ModelAndView mav = new ModelAndView();
		System.out.println("받아온 도시 : "+ctcode); //도시 이름 자체로 가져옴
		System.out.println("받아온 카테고리 : "+category);
		
		String getctcode = tsvc.getctcode(ctcode);
		System.out.println(getctcode);
		
		ArrayList<Festival> FestSearch = tsvc.FestSearch(getctcode,category);

			
		return new Gson().toJson(FestSearch);
	}
	
	@RequestMapping(value = "/scheduleUpdate")
	public @ResponseBody String scheduleUpdate(Schedule sc, String scOption) {
		System.out.println("스케쥴 수정");
		System.out.println(sc);
		int rs = tsvc.scUpdate(sc, scOption);
		return null;
	}
	
	
	
	@RequestMapping(value="/SearchServiceTd")
	public @ResponseBody String SearchServiceTd(String searchval,String searchcate) {
		ModelAndView mav = new ModelAndView();
		System.out.println("검색한 변수"+searchval);
		System.out.println("검색한 변수"+searchcate);
		
		ArrayList<Tdest> TdestList = tsvc.TdestList(searchval);
		mav.addObject("TdestList",TdestList);
					
		return new Gson().toJson(TdestList);
	}
	
	@RequestMapping(value="/SearchServiceFe")
	public @ResponseBody String SearchServiceFe(String searchval,String searchcate) {
		ModelAndView mav = new ModelAndView();
		System.out.println("검색한 변수"+searchval);
		System.out.println("검색한 변수"+searchcate);
		
		ArrayList<Festival> FestList = tsvc.FestList(searchval);
		mav.addObject("FestList",FestList);
		
		return new Gson().toJson(FestList);
	}
}
