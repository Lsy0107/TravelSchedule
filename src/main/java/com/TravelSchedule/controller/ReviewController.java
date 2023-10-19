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
		Calendar Rev = rsvc.Rev();
		System.out.println(Rev);
		mav.addObject("Cal",CalendarList);
		mav.setViewName("review/TravelReview");
		return mav;
	}
	@RequestMapping(value="PrintSchedule")
	public @ResponseBody String PrintSchedule(String cdcode,String tdcode, String fecode) {
		System.out.println("받아온 cdcode : "+cdcode);
		System.out.println("받아온 tdcode : "+tdcode);
		System.out.println("받아온 fecode : "+fecode);
		
		ArrayList<Schedule> PrintSchedule = rsvc.PrintSchedule(cdcode,tdcode,fecode);
		System.out.println(PrintSchedule);							
		
		return new Gson().toJson(PrintSchedule);
	}
}
