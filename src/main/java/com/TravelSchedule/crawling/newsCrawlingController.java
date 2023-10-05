package com.TravelSchedule.crawling;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class newsCrawlingController {

	@Autowired
	newsCrawlingService newcsvc;
	
	@RequestMapping(value="/joongang")
	public void joogang() {
		System.out.println("joongang 페이지 크롤링 요청");
		newcsvc.getNews();
	}
}
