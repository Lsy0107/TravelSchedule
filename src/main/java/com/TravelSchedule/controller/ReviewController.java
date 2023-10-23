package com.TravelSchedule.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.TravelSchedule.dto.Calendar;
import com.TravelSchedule.dto.Schedule;
import com.TravelSchedule.service.ReviewService;
import com.google.gson.Gson;

@Controller
public class ReviewController {

	@Autowired
	ReviewService rsvc;
	
	@RequestMapping(value="/TravelReview")
	public ModelAndView TravelReview(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		System.out.println("여행 리뷰 작성 페이지 이동");
		
		String mid = (String)session.getAttribute("loginId");
		System.out.println("현재 아이디 : "+mid);
		
		ArrayList<Calendar> CalendarList = rsvc.CalendarList();
		
		
		mav.addObject("Cal",CalendarList);
		mav.setViewName("review/TravelReview");
		return mav;
	}
	@RequestMapping(value="PrintSchedule")
	public @ResponseBody String PrintSchedule(String cdcode) {
		System.out.println("받아온 cdcode : "+cdcode);

		
		ArrayList<Schedule> PrintSchedule = rsvc.PrintSchedule(cdcode);
		System.out.println(PrintSchedule);							
		
		return new Gson().toJson(PrintSchedule);
	}
	
	@RequestMapping(value="getTdName")
	public @ResponseBody String getTdName(String tdcode,String cdcode) {
		System.out.println("받아온tdcode : "+tdcode);
		System.out.println("받아온cdcode : "+cdcode);
		
		String getTdName = rsvc.getTdName(tdcode,cdcode);
		System.out.println(getTdName);
		return new Gson().toJson(getTdName);
	}
	@RequestMapping(value="getFeName")
	public @ResponseBody String getFeName(String fecode,String cdcode) {
		System.out.println("받아온fecode : "+fecode);
		System.out.println("받아온cdcode : "+cdcode);
		
		String getFeName = rsvc.getFeName(fecode,cdcode);
		System.out.println(getFeName);
		return new Gson().toJson(getFeName);
	}
}
