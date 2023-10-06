package com.TravelSchedule.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.TravelSchedule.dto.Tdest;
import com.TravelSchedule.service.ApiService;

@Controller
public class ApiController {

	@Autowired
	private ApiService asvc;
	
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
