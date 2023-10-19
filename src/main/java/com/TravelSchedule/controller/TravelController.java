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
import com.TravelSchedule.dto.Tdest;
import com.TravelSchedule.service.TravelService;
import com.google.gson.Gson;

@Controller
public class TravelController {

	@Autowired
	TravelService tsvc;

	@RequestMapping(value="/removeDest")
	public @ResponseBody String removeDest(Schedule sc, String seloption){
		System.out.println("캘린더 개획 삭제");
		int rs = tsvc.removeDest(sc, seloption);
		String result = "N";
		if(rs>0) {
			result = "Y";
		}
		return result;
	}
	
	@RequestMapping(value="/removeCalendar")
	public @ResponseBody boolean removeCalendar(Calendar cd) {
		System.out.println("캘린더 삭제하기");
		ArrayList<Schedule> scList = tsvc.checkSchedule(cd);
		System.out.println(scList.size());
		int resc = 1;
		
		boolean rs = false;
		if(scList.size() != 0) {
			resc = tsvc.removeSchedule(cd);
			System.out.println(resc);
			if(resc>0) {
				int recd = tsvc.removeCalendar(cd);
				if(recd>0) {
					rs = true;
					System.out.println(recd);
				}
			}
		}else {
			int recd = tsvc.removeCalendar(cd);
			if(recd>0) {
				rs = true;
				System.out.println(recd);
			}
		}
		return rs;
	}
	
	@RequestMapping(value="/updateCdstate")
	public @ResponseBody String updateCdstate(String cdcode, HttpSession session) {
		System.out.println("계획 확정하기");
		String mid = (String)session.getAttribute("loginId");
		System.out.println(cdcode);
		Calendar cd = new Calendar();
		cd.setCdcode(cdcode);
		cd.setMid(mid);
		ArrayList<Schedule> scList = new ArrayList<Schedule>();
		try {
			scList = tsvc.checkSchedule(cd);			
		} catch (Exception e) {
			// TODO: handle exception
		}
		System.out.println(scList);
		String result = "N";
		if(scList != null) {	
			System.out.println("asd");
			System.out.println(scList.get(0).getScdate());
			if(scList.get(0).getScdate()!=null) {
				int rs = tsvc.updateCdstate(cdcode, mid);
				if(rs>0 ) {
					result = "Y";					
				}else {
					result="C";					
				}
		}
		}
		return result;
	}
	
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
		Calendar cd = tsvc.getCalendar(mid, cdcode);
		ArrayList<HashMap<String, String>> sctdList = tsvc.select_sc_td_join(mid, cdcode);
		ArrayList<HashMap<String, String>> lalngList = new ArrayList<HashMap<String, String>>();
		for (HashMap<String, String> sctd : sctdList) {
			if (!sctd.containsKey("SCDATE")) {
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
		mav.addObject("cd",cd);
		mav.addObject("scdestList", sctdList);
		mav.addObject("lalngList", new Gson().toJson(lalngList));
		mav.setViewName("/travel/TravelSchedule");
		return mav;
	}

	@RequestMapping(value = "/registSelectDest")
	public @ResponseBody String registSelectDest(Schedule sc, String seloption) {
		System.out.println("여행지 선택");
		System.out.println(sc);
		Schedule checksc = tsvc.getSchedule(sc, seloption);
		String response = "Y";
		if (checksc == null) {
			int rs = tsvc.registSelectDest(sc, seloption);
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
	
	@RequestMapping(value="/detailTdest")
	public ModelAndView detailTdest(String tdcode) {
		ModelAndView mav = new ModelAndView();
		System.out.println("여행지 상세 정보 페이지이동");
		System.out.println("TDCODE : "+tdcode);
		Tdest detailTdest = tsvc.detailTdest(tdcode);
		System.out.println(detailTdest);
		mav.addObject("detailTd",detailTdest);
		mav.setViewName("/travel/detailTdest");
		
		return mav;
	}
	
}
