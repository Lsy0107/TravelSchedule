package com.TravelSchedule.controller;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(Model model) {
		System.out.println("메인페이지 이동 요청");
		ModelAndView mav = new ModelAndView();
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
}
