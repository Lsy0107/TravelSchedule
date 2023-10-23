package com.TravelSchedule.controller;

import java.util.ArrayList;
import java.util.HashMap;

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
		
		ArrayList<Calendar> CalendarList = rsvc.CalendarList(mid);
		
		
		mav.addObject("Cal",CalendarList);
		mav.setViewName("review/TravelReview");
		return mav;
	}
	@RequestMapping(value="PrintSchedule")
	public @ResponseBody String PrintSchedule(String cdcode,HttpSession session) {
		System.out.println("받아온 cdcode : "+cdcode);

		String mid = (String)session.getAttribute("loginId");
		System.out.println("현재 아이디 : "+mid);
		
		ArrayList<Schedule> PrintSchedule = rsvc.PrintSchedule(cdcode,mid);
		System.out.println(PrintSchedule);							
		
		return new Gson().toJson(PrintSchedule);
	}
	
	@RequestMapping(value="getTdName")
	public @ResponseBody String getTdName(String tdcode,String cdcode,HttpSession session) {
		System.out.println("받아온tdcode : "+tdcode);
		System.out.println("받아온cdcode : "+cdcode);
		
		String mid = (String)session.getAttribute("loginId");
		System.out.println("현재 아이디 : "+mid);
		
		String getTdName = rsvc.getTdName(tdcode,cdcode,mid);
		System.out.println(getTdName);
		return new Gson().toJson(getTdName);
	}
	@RequestMapping(value="getFeName")
	public @ResponseBody String getFeName(String fecode,String cdcode,HttpSession session) {
		System.out.println("받아온fecode : "+fecode);
		System.out.println("받아온cdcode : "+cdcode);
		
		String mid = (String)session.getAttribute("loginId");
		System.out.println("현재 아이디 : "+mid);
		
		String getFeName = rsvc.getFeName(fecode,cdcode,mid);
		System.out.println(getFeName);
		return new Gson().toJson(getFeName);
	}
	
	//리뷰작성페이지 이동
	@RequestMapping(value="ReviewWriteForm")
	public ModelAndView ReviewWriteForm(String cdcode,HttpSession session) {
		System.out.println("리뷰작성페이지 이동");
		System.out.println("받아온 cdcode : "+cdcode);
		ModelAndView mav = new ModelAndView();
		String mid = (String)session.getAttribute("loginId");
		
		ArrayList<HashMap<String,String>> getTdInfo = rsvc.getTdInfo(cdcode,mid);
		ArrayList<HashMap<String,String>> getFeInfo = rsvc.getFeInfo(cdcode,mid);
		System.out.println(getTdInfo);
		
		mav.addObject("Td", getTdInfo);
		mav.addObject("Fe", getFeInfo);
		mav.setViewName("review/ReviewWriteForm");
		return mav;
	}
	
}
