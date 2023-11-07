package com.TravelSchedule.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.TravelSchedule.crawling.newsCrawlingService;
import com.TravelSchedule.dto.Festival;
import com.TravelSchedule.dto.News;
import com.TravelSchedule.dto.Schedule;
import com.TravelSchedule.dto.Tdest;
import com.TravelSchedule.service.ApiService;
import com.TravelSchedule.service.TravelService;

public class adminController {
	
	@Autowired
	newsCrawlingService nsvc;
	@Autowired
	ApiService apisvc;
	
	@Autowired
	TravelService tsvc;	
	/*
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(Model model) {
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
		
		mav.setViewName("/adminMain");
		return mav;
	}
	 * */
	
	
	
}
