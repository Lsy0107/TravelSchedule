package com.TravelSchedule.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.TravelSchedule.crawling.newsCrawlingService;
import com.TravelSchedule.dto.Festival;
import com.TravelSchedule.dto.News;
import com.TravelSchedule.dto.Tdest;
import com.TravelSchedule.service.ApiService;
import com.google.gson.Gson;

@Controller
public class HomeController {
	
	@Autowired
	newsCrawlingService nsvc;
	@Autowired
	ApiService apisvc;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(Model model) {
		System.out.println("메인페이지 이동 요청");
		ModelAndView mav = new ModelAndView();

		ArrayList<News> newsList = nsvc.getNewsList();
		ArrayList<Tdest> tdList = apisvc.getTdList();
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
	
	@RequestMapping(value="/detailPage")
	public ModelAndView detailPage(String code) {
		System.out.println("상세페이지 이동");
		ModelAndView mav = new ModelAndView();
		System.out.println(code);
		String codeName = code.substring(0,2);
		//System.out.println(codeName);
		if(codeName.equals("FE")) {
			Festival festival = apisvc.detailFestival(code);
			System.out.println(festival);
			mav.addObject("festival", festival);
			
		} else if(codeName.equals("TD")) {
			// Tdest 셀렉트하셈
		}
		mav.setViewName("travel/detailPage");
		return mav;
		
	}
}
