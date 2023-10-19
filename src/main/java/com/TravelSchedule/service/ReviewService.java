package com.TravelSchedule.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.TravelSchedule.dao.ReviewDao;
import com.TravelSchedule.dto.Calendar;
import com.TravelSchedule.dto.Schedule;

@Service
public class ReviewService {

	@Autowired
	ReviewDao rdao;
	
	public ArrayList<Calendar> CalendarList() {
		System.out.println("계획 출력 서비스");
		
		ArrayList<Calendar> CalendarListDao = rdao.CalendarListDao();
		return CalendarListDao;
	}

	public ArrayList<Schedule> PrintSchedule(String cdcode, String tdcode, String fecode) {
		System.out.println("PrintSchedule- 서비스 호출");
		
		ArrayList<Schedule> PrintScheduleDao = rdao.PrintScheduleDao(cdcode,tdcode,fecode);
		
		return PrintScheduleDao;
	}

	public Calendar Rev() {

		Calendar Rr = rdao.Rr();
		return Rr;
	}

}
