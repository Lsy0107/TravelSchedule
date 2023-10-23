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

	public ArrayList<Schedule> PrintSchedule(String cdcode) {
		System.out.println("PrintSchedule- 서비스 호출");

		ArrayList<Schedule> PrintScheduleDao = rdao.PrintScheduleDao(cdcode);

		return PrintScheduleDao;
	}

	public String getTdName(String tdcode, String cdcode) {
		System.out.println("tdcode의 이름 조회서비스");

		String getTdNameSvc = rdao.getTdNameSvc(tdcode, cdcode);
		return getTdNameSvc;
	}

	public String getFeName(String fecode, String cdcode) {
		System.out.println("fecode의 이름 조회서비스");

		String getFeNameSvc = rdao.getFeNameSvc(fecode, cdcode);
		return getFeNameSvc;
	}

}
