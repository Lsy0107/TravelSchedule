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
import com.TravelSchedule.dto.Member;
import com.TravelSchedule.dto.News;
import com.TravelSchedule.dto.Review;
import com.TravelSchedule.dto.Schedule;
import com.TravelSchedule.dto.Tdest;
import com.TravelSchedule.service.ApiService;
import com.TravelSchedule.service.ReviewService;
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
	
	@Autowired
	TravelController tctl;

	@Autowired
	ReviewService rsvc;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(Model model, HttpSession session) {
		System.out.println("메인페이지 이동 요청");
		ModelAndView mav = new ModelAndView();
		ArrayList<Festival> feList = apisvc.getFeList();
		ArrayList<News> newsList = nsvc.getNewsList();
		ArrayList<Tdest> tdList = apisvc.getTdList();
		ArrayList<Schedule> scList = tsvc.getScList();

		mav.addObject("feList", feList);
		mav.addObject("newList", newsList);
		mav.addObject("tdList", tdList);
		mav.addObject("scList", scList);

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
			System.out.println(re);
			String codeList = (String)re.get("CODELIST");
			String[] codeSplit = codeList.split("/");
			for(String cs : codeSplit) { //cs => codeList를 /로 나눈 코드들
				//System.out.println(cs);
				if(cs.contains(code)) {
					ReList.add(re);
				}			
			}
			
		}
		
		String CountReviewFe = apisvc.CountReviewFe(code);
		mav.addObject("CR",CountReviewFe);
		
		System.out.println("리뷰리스트"+ReList);
		mav.addObject("Re",ReList);
		
		Festival festival = apisvc.detailFestival(code);
		System.out.println(festival);
		String ctcode = festival.getCtcode();
		String fecode = festival.getFecode();
		ArrayList<Festival> Nearby = apisvc.festival_Nearby(ctcode, fecode);
		String country = apisvc.getCountry_this(ctcode);
		ArrayList<Tdest> tdest = tsvc.TdestSearch();
		String date = apisvc.getDate(code);
		System.out.println(Nearby);
		mav.addObject("country",country);
		mav.addObject("festival", festival);
		mav.addObject("nearby", Nearby);
		mav.addObject("tdest", tdest);
		mav.addObject("ReList",ReList);
		mav.addObject("date", date);
		mav.setViewName("travel/detailFestival");
		return mav;
	}
	@RequestMapping(value="/TdestSearchPage")
	public ModelAndView TdestSearchPage(String category, String ctcode, String name) throws Exception {
		System.out.println("여행지 검색 페이지 이동");
		ModelAndView mav = new ModelAndView();
		//ArrayList<Tdest> TdestList = apisvc.getTdestList();
//		ArrayList<Tdest> TdestList = tsvc.TdestSearch();
		ArrayList<Country> CountryList = tsvc.CountryList();
		
		System.out.println(category);
		System.out.println(ctcode);
		System.out.println(name);
		
		mav.addObject("CountryList",CountryList);
		mav.addObject("category", category);
		mav.addObject("ctcode", ctcode);
		mav.addObject("name", name);
		
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
			lk.setRecode(code);
		}
		String result = apisvc.getLikelist(lk, seloption); // "Y","N"
		System.out.println(result);
		if(result.equals("Y")) {
			int delete = apisvc.deleteLk(lk, seloption);
			
		} else {
			int insert = apisvc.insertLk(lk, seloption);
			
		}
		String lknum = apisvc.selectLk(code, seloption);
		System.out.println(lknum);
		
				
		return lknum;
		
	}
	
	@RequestMapping(value="/TravelLike")
	public ModelAndView TravelReview(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		System.out.println("여행 즐겨찾기 페이지 이동");
		ArrayList<Tdest> tdList = new ArrayList<Tdest>();
		String mid = (String)session.getAttribute("loginId");
		System.out.println("현재 아이디 : "+mid);
		
		ArrayList<Likelist> likeList = apisvc.likeList_td(mid);		
		for(int i = 0; i < likeList.size(); i++) {
			String tdcode = likeList.get(i).getTdcode();
			Tdest tdest = apisvc.getTdest(tdcode);
			tdList.add(tdest);
		}
		String result = "font-weight: bold; text-decoration-line: underline;";
		mav.addObject("css1", result);
		String select = "border-left: thick solid red;";
		mav.addObject("sel", select);
		mav.addObject("td", tdList);
		mav.setViewName("review/TravelLike");
		return mav;
	}
	@RequestMapping(value="/FestivalLike")
	public ModelAndView FestivalLike(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		System.out.println("축제 즐겨찾기 페이지 이동");
		ArrayList<Festival> feList = new ArrayList<Festival>();
		String mid = (String)session.getAttribute("loginId");
		System.out.println("현재 아이디 : "+mid);
		
		ArrayList<Likelist> likeList = apisvc.likeList_fe(mid);		
		for(int i = 0; i < likeList.size(); i++) {
			String fecode = likeList.get(i).getFecode();
			Festival festival = apisvc.getFe(fecode);
			feList.add(festival);
		}
		String result = "font-weight: bold; text-decoration-line: underline;";
		mav.addObject("css2", result);
		String select = "border-left: thick solid red;";
		mav.addObject("sel", select);
		mav.addObject("fe", feList);
		mav.setViewName("review/TravelLike");
		return mav;
	}
	@RequestMapping(value="/ReviewLike")
	public ModelAndView ReviewLike(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		System.out.println("리뷰 즐겨찾기 페이지 이동");
		ArrayList<Review> reList = new ArrayList<Review>();
		String mid = (String)session.getAttribute("loginId");
		System.out.println("현재 아이디 : "+mid);
		
		ArrayList<Likelist> likeList = apisvc.likeList_re(mid);		
		for(int i = 0; i < likeList.size(); i++) {
			String recode = likeList.get(i).getRecode();
			Review review = apisvc.getReview(recode);
			reList.add(review);
		}		
		String result = "font-weight: bold; text-decoration-line: underline;";
		mav.addObject("css3", result);
		String select = "border-left: thick solid red;";
		mav.addObject("sel", select);
		mav.addObject("re", reList);
		mav.setViewName("review/TravelLike");
		return mav;
	}
	@RequestMapping(value="/adminMain")
	public ModelAndView adminMain() {
		ModelAndView mav = new ModelAndView();
		System.out.println("관리자페이지 이동");
		
		mav.setViewName("/admin/adminMain");
		return mav;
	}
	@RequestMapping(value="/adminReview")
	public ModelAndView adminReview(Review review) {
		ModelAndView mav = new ModelAndView();
		System.out.println("리뷰관리페이지 이동");
		
		ArrayList<Review> rList = rsvc.getReviewList(review);
		mav.addObject("rList", rList);
		
		mav.setViewName("/admin/adminReview");
		return mav;
	}
	

}
