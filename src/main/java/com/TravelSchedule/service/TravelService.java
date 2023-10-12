package com.TravelSchedule.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.TravelSchedule.dao.TravelDao;
import com.TravelSchedule.dto.Calendar;
import com.TravelSchedule.dto.Schedule;
import com.TravelSchedule.dto.Tdest;

@Service
public class TravelService {

	@Autowired
	TravelDao tdao;
	
	public ArrayList<Calendar> getCalendar(String mid) {
		System.out.println("TravelService - getCalender()");
		return tdao.selectCalendar(mid);
	}

	public int registCalendar(Calendar cd) {
		System.out.println("TravelService - registCalendar()");
		String cdcode = tdao.maxcode(cd.getMid());
		if(cdcode.equals("CD00000")) {
		cdcode = "CD00001";	
		}else {
			
		String codeName = cdcode.substring(0,2);
		int codeNum = Integer.parseInt(cdcode.substring(2))+1;
		String codeNum_String = String.format("%05d", codeNum);
		cdcode = codeName + codeNum_String;
		}
		System.out.println(cdcode);
		cd.setCdcode(cdcode);
		
		return tdao.insertCalendar(cd);
	}

	public ArrayList<Calendar> getCdcode(String mid) {
		System.out.println("travelService - getCdcode()");
		return tdao.selectCdcode(mid);
	}

	public int registSelectDest(Schedule sc) {
		System.out.println("travelService - registSelectDest()");
		
		return tdao.insertFKcode(sc);
	}

	public int updateSc(Schedule sc, String seloption) {
		System.out.println("TravelService - updateSc()");
		return tdao.updateSc(sc,seloption);
	}

	public ArrayList<HashMap<String, String>> select_sc_td_join(String mid, String cdcode) {
		System.out.println("TravelService - select_sc_td_join()");
		return tdao.select_sc_td_join(mid, cdcode);
	}


}
