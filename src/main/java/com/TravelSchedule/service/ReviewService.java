package com.TravelSchedule.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.TravelSchedule.dao.ReviewDao;
import com.TravelSchedule.dto.Calendar;
import com.TravelSchedule.dto.Schedule;

@Service
public class ReviewService {

	@Autowired
	ReviewDao rdao;

	public ArrayList<Calendar> CalendarList(String mid) {
		System.out.println("계획 출력 서비스");

		ArrayList<Calendar> CalendarListDao = rdao.CalendarListDao(mid);
		return CalendarListDao;
	}

	public ArrayList<Schedule> PrintSchedule(String cdcode, String mid) {
		System.out.println("PrintSchedule- 서비스 호출");

		ArrayList<Schedule> PrintScheduleDao = rdao.PrintScheduleDao(cdcode, mid);

		return PrintScheduleDao;
	}

	public String getTdName(String tdcode, String cdcode, String mid) {
		System.out.println("tdcode의 이름 조회서비스");

		String getTdNameSvc = rdao.getTdNameSvc(tdcode, cdcode, mid);
		return getTdNameSvc;
	}

	public String getFeName(String fecode, String cdcode, String mid) {
		System.out.println("fecode의 이름 조회서비스");

		String getFeNameSvc = rdao.getFeNameSvc(fecode, cdcode, mid);
		return getFeNameSvc;
	}

	public ArrayList<HashMap<String, String>> getTdInfo(String cdcode, String mid) {
		System.out.println("리뷰작성페이지 선택 계획 정보 서비스");

		ArrayList<HashMap<String, String>> getTdInfoDao = rdao.getTdInfoDao(cdcode, mid);
		return getTdInfoDao;
	}

	public ArrayList<HashMap<String, String>> getFeInfo(String cdcode, String mid) {
		System.out.println("리뷰작성페이지 선택 계획 정보 서비스");

		ArrayList<HashMap<String, String>> getFeInfoDao = rdao.getFeInfoDao(cdcode, mid);
		return getFeInfoDao;
	}

}
