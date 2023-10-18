package com.TravelSchedule.crawling;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class newsCrawlingController {

	@Autowired
	newsCrawlingService nsvc;
	
	@RequestMapping(value="/joongang")
	public ModelAndView joogang() {
		System.out.println("joongang 페이지 크롤링 요청");
		nsvc.getNews();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/");
		return mav;
	}
}
