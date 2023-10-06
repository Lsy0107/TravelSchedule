package com.TravelSchedule.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.TravelSchedule.dto.Festival;
import com.TravelSchedule.dto.Tdest;
import com.TravelSchedule.service.ApiService;


@Controller
public class ApiController {
	@Autowired
	public ApiService asvc;
	
	@RequestMapping(value="/festival")
	public ModelAndView festival() throws Exception {
		System.out.println("축제 리스트 불러오기 - festival()");
		ModelAndView mav = new ModelAndView();
		
		//1. 버스 도착 정보 조회
		
		ArrayList<Festival> result  = asvc.getFestival();
		System.out.println(result);
		mav.addObject("festival",result);
		
		//2. 버스도착정보 페이지
		mav.setViewName("Festival");
		
		
		
		return mav;
	}

	@RequestMapping(value="/TdestSearch")
	public ModelAndView areaBasedList1() throws Exception {
		System.out.println("/TdestSearch 컨트롤러 호출");
		ModelAndView mav = new ModelAndView();
		
		ArrayList<Tdest> TdestList = asvc.getTdestList();  
		
		mav.addObject("TdestList",TdestList);
		mav.setViewName("travel/TdestSearch");
		
		return mav;
	}


}
