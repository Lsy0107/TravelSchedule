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
import com.TravelSchedule.service.TravelService;
import com.google.gson.Gson;

@Controller
public class TravelController {

	@Autowired
	TravelService tsvc;

	@RequestMapping(value = "/updateSc")
	public @ResponseBody String updateSc(Schedule sc, String seloption) {
		System.out.println("스케쥴 등록하기");
		int rs = tsvc.updateSc(sc, seloption);
		return null;
	}

	@RequestMapping(value = "/getSchedule", produces = "application/text; charset=utf8")
	public @ResponseBody String getSchedule(String cdcode, String mid) {
		System.out.println("달력 선택 페이지 스케쥴 가져오기");
		System.out.println(cdcode + mid);
		ArrayList<HashMap<String, String>> scList = tsvc.select_sc_td_join(mid, cdcode);
		return new Gson().toJson(scList);
	}

	@RequestMapping(value = "/travelSc")
	public ModelAndView travelMkSc(String cdcode, HttpSession session) {
		System.out.println("여행 계획 페이지 이동");
		ModelAndView mav = new ModelAndView();
		String mid = (String) session.getAttribute("loginId");
		ArrayList<HashMap<String, String>> sctdList = tsvc.select_sc_td_join(mid, cdcode);
		ArrayList<HashMap<String, String>> lalngList = new ArrayList<HashMap<String, String>>();
		for (HashMap<String, String> sctd : sctdList) {
			if (!sctd.containsKey("SCDATE")) {
				System.out.println("여기");
				continue;
			}
			HashMap<String, String> lalng = new HashMap<String, String>();
			if (sctd.containsKey("TDCODE")) {
				lalng.put("lati", sctd.get("TDLONGTI"));
				lalng.put("longti", sctd.get("TDLATI"));
				lalng.put("name", sctd.get("TDNAME"));
			} else {
				lalng.put("lati", sctd.get("FELONGTI"));
				lalng.put("longti", sctd.get("FELATI"));
				lalng.put("name", sctd.get("FENAME"));
			}
			lalng.put("scdate", sctd.get("SCDATE"));
			lalngList.add(lalng);
		}
		mav.addObject("scdestList", sctdList);
		mav.addObject("lalngList", new Gson().toJson(lalngList));
		mav.setViewName("/travel/TravelSchedule");
		return mav;
	}

	@RequestMapping(value = "/registSelectDest")
	public @ResponseBody String registSelectDest(Schedule sc, String seloption) {
		System.out.println("여행지 선택");
		Schedule checksc = tsvc.getSchedule(sc, seloption);
		System.out.println("checksc : "+checksc);
		String response = "Y";
		if (checksc == null) {
			int rs = tsvc.registSelectDest(sc);
			if (rs <= 0) {
				response = "N";
			}
		} else {
			response = "N";
		}
		return response;
	}

	@RequestMapping(value = "/selectCalendar")
	public ModelAndView selectCalendar(HttpSession session) {
		System.out.println("달력 선택 페이지");
		ModelAndView mav = new ModelAndView();
		String mid = (String) session.getAttribute("loginId");
		ArrayList<Calendar> cdList = tsvc.getCalendar(mid);
		mav.addObject("cdList", cdList);
		mav.setViewName("/travel/SelectCalendar");
		return mav;

	}

	@RequestMapping(value = "/registCalendar")
	public @ResponseBody String registCalendar(Calendar cd) {
		System.out.println("달력 만들기");
		int rs = tsvc.registCalendar(cd);
		String result = "";
		if (rs > 0) {
			result = "Y";
		} else {
			result = "N";
		}
		return result;
	}

	@RequestMapping(value = "/getCdcode")
	public @ResponseBody ArrayList<Calendar> getCdcode(String mid) {
		System.out.println("cdcode 가져오기");
		return tsvc.getCdcode(mid);
	}

}
