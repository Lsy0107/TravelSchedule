package com.TravelSchedule.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.annotation.RequestScope;
import org.springframework.web.servlet.ModelAndView;

import com.TravelSchedule.service.WeatherApiService;

@Controller
public class WeatherApiController {
	
	@Autowired
	private WeatherApiService wapisvc;
	
	@RequestMapping(value="weatherApi")
	public ModelAndView weatherApi() throws IOException {
		System.out.println("weatherApi - 날씨정보 조회요청");
		
		ModelAndView mav = new ModelAndView();
		
		String result = wapisvc.weatherApi();
		
		mav.setViewName("weatherApi");
		
		return mav;
	}
	
}
