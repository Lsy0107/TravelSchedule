package com.TravelSchedule.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.TravelSchedule.crawling.newsCrawlingService;
import com.TravelSchedule.dto.Country;
import com.TravelSchedule.dto.Festival;
import com.TravelSchedule.dto.Likelist;
import com.TravelSchedule.dto.News;
import com.TravelSchedule.dto.Review;
import com.TravelSchedule.dto.Tdest;
import com.TravelSchedule.service.ApiService;
import com.TravelSchedule.service.TravelService;
import com.google.gson.Gson;


@Controller
public class HomeController {
	
	@Autowired
	newsCrawlingService nsvc;
	@Autowired
	ApiService apisvc;
	
	@Autowired
	TravelService tsvc;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(Model model) {
		System.out.println("메인페이지 이동 요청");
		ModelAndView mav = new ModelAndView();
		ArrayList<Festival> feList = apisvc.getFeList();
		ArrayList<News> newsList = nsvc.getNewsList();
		ArrayList<Tdest> tdList = apisvc.getTdList();
		mav.addObject("feList", feList);
		mav.addObject("newList", newsList);
		mav.addObject("tdList", tdList);

		mav.setViewName("/main");
		return mav;
	}
	@RequestMapping(value="memberLoginForm")
	public ModelAndView loginPage(){
		System.out.println("로그인 페이지 이동");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/member/memberLoginForm");
		
		return mav;
	}
	@RequestMapping(value="memberJoinForm")
	public ModelAndView joinPage() {
		System.out.println("회원가입 페이지 이동");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/member/memberJoinForm");
		
		return mav;
	}
	
	@RequestMapping(value="/festival_country")
	public @ResponseBody String festival_country(String ctcode) {
		System.out.println("지역별 축제 불러오기");
		ArrayList<Festival> result = apisvc.festival_country(ctcode);
		return new Gson().toJson(result);
		
	}
	
	@RequestMapping(value="/detailFestival")
	public ModelAndView detailPage(String code, HttpSession session) {
		System.out.println("상세페이지_축제 이동");
		System.out.println(code);
		ModelAndView mav = new ModelAndView();		
		if(session.getAttribute("loginId") != null) {
			Likelist lk = new Likelist();
			lk.setFecode(code);		
			lk.setMid((String)session.getAttribute("loginId"));
			System.out.println(lk.getMid());
			String seloption = "festival";
			//System.out.println(codeName);
			String Like = apisvc.getLikelist(lk, seloption);
			mav.addObject("like", Like);
		}
		//System.out.println("키값 : "+codeList);
		
		ArrayList<HashMap<String,String>> ReList = new ArrayList<>();
		
		ArrayList<HashMap<String,String>> reList = apisvc.reList();
		for(HashMap<String, String> re : reList) {
			String codeList = (String)re.get("CODELIST");
			String[] codeSplit = codeList.split("/");
			for(String cs : codeSplit) { //cs => codeList를 /로 나눈 코드들
				System.out.println(cs);
				if(cs.contains(code)) {
					ReList.add(re);
				}			
			}
			
		}
		
		
		
		System.out.println("리뷰리스트"+ReList);
		mav.addObject("Re",ReList);
		
		Festival festival = apisvc.detailFestival(code);
		String ctcode = festival.getCtcode();
		String fecode = festival.getFecode();
		ArrayList<Festival> Nearby = apisvc.festival_Nearby(ctcode, fecode);
		String country = apisvc.getCountry_this(ctcode);
		ArrayList<Tdest> tdest = tsvc.TdestSearch();
		System.out.println(country);
		mav.addObject("country",country);
		mav.addObject("festival", festival);
		mav.addObject("nearby", Nearby);
		mav.addObject("tdest", tdest);
		mav.setViewName("festival/detailFestival");
		return mav;
	}
	@RequestMapping(value="/TdestSearchPage")
	public ModelAndView TdestSearchPage() {
		System.out.println("여행지 검색 페이지 이동");
		ModelAndView mav = new ModelAndView();
		
//		ArrayList<Tdest> TdestList = tsvc.TdestSearch();
		ArrayList<Country> CountryList = tsvc.CountryList();
		
		mav.addObject("CountryList",CountryList);
//		mav.addObject("TdestList",TdestList);
		mav.setViewName("/travel/TdestSearch");
		return mav;
	}
	@RequestMapping(value="TdestCtSearchPage")
	public @ResponseBody String TdestCtSearchPage(String ctcode){
		System.out.println("도시코드 받아온 컨트롤러");
		ModelAndView mav = new ModelAndView();
		System.out.println("받아온 도시코드 : "+ctcode);
		
		ArrayList<Tdest> TdestList = tsvc.CtTdestList(ctcode);
		
		mav.addObject("TdestList",TdestList);
		mav.setViewName("/travel/TdestSearch");
		return new Gson().toJson(TdestList);
	}
	
	@RequestMapping(value="/SearchService")
	public @ResponseBody ModelAndView SearchService(String searchVal) {
		ModelAndView mav = new ModelAndView();
		System.out.println("검색한 변수"+searchVal);
		ArrayList<Tdest> TdestList = tsvc.SearchTdestList(searchVal);
		ArrayList<Country> CountryList = tsvc.CountryList();
		mav.addObject("CountryList",CountryList);
		mav.addObject("TdestList",TdestList);
		mav.setViewName("/travel/TdestSearch");
		
		return mav;
	}
	
	@RequestMapping(value="/SearchService_fe")
	public @ResponseBody ModelAndView SearchService_fe(String searchVal) {
		ModelAndView mav = new ModelAndView();
		System.out.println("검색한 변수"+searchVal);
		ArrayList<Festival> FestivalList = apisvc.SearchFestivalList(searchVal);
		ArrayList<Country> CountryList = tsvc.CountryList();
		mav.addObject("country",CountryList);
		mav.addObject("festival",FestivalList);
		mav.setViewName("/festival/Festival");
		
		return mav;
	}
	
	@RequestMapping(value="/clickHeart")
	public @ResponseBody String clickHeart(String mid, String code, String seloption, Likelist lk) {
		System.out.println("셀옵션 : " + seloption);
		String Lkcode = apisvc.getLkcode(lk);		
		lk.setLkcode(Lkcode);
		lk.setMid(mid);
		if(seloption.equals("festival") ) {
			lk.setFecode(code);
		} else if(seloption.equals("tdest")) {
			lk.setTdcode(code);
		} else {
			//lk.setRecode(code);
		}
		String result = apisvc.getLikelist(lk, seloption); // "Y","N"
		if(result.equals("Y")) {
			int delete = apisvc.deleteLk(lk, seloption);
		} else {
			int insert = apisvc.insertLk(lk, seloption);
		}
		
				
		return result;
		
	}
}
