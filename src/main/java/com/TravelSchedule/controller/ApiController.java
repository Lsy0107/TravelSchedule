package com.TravelSchedule.controller;

import java.io.IOException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.TravelSchedule.dto.Country;
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
		
		ArrayList<Country> country = asvc.getCountry();
		mav.addObject("country",country);
		
		//ArrayList<Festival> result  = asvc.getFestival();
		//ArrayList<Festival> result = asvc.getFestival_db(); 

//		System.out.println(result);
		//mav.addObject("festival",result);
		
		mav.setViewName("festival/Festival");
		
		
		
		return mav;
	}

	@RequestMapping(value="/TdestSearch")
	public ModelAndView areaBasedList1() throws Exception {
		System.out.println("/TdestSearch 컨트롤러 호출");
		ModelAndView mav = new ModelAndView();		
		//ArrayList<Tdest> TdestList = asvc.getTdestList();  					
		
		//mav.addObject("TdestList",TdestList);
		mav.setViewName("travel/TdestSearch");
		
		return mav;
	}
	
	


}
