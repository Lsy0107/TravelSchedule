package com.TravelSchedule.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.TravelSchedule.dao.TdestDao;
import com.TravelSchedule.dto.Tdest;

@Service
public class TdestService {

	@Autowired
	TdestDao tdao;
	
	public ArrayList<Tdest> TdestSearch() {
		System.out.println("SERVICE - 여행지 검색 페이지 이동 서비스");
		
		ArrayList<Tdest> TdestService = tdao.TdestService();
		return TdestService;
	}

	public ArrayList<Tdest> CtTdestList(String ctcode) {
		System.out.println("SERVICE - 도시코드 기반 여행지 검색 서비스");
		
		ArrayList<Tdest> CtTdestService = tdao.CtTdestService(ctcode);
		return CtTdestService;
	}

	public ArrayList<Tdest> SearchTdestList(String searchVal) {
		System.out.println("SERVICE - 검색 결과 요청");
		
		ArrayList<Tdest> SearchTdest = tdao.SearchTdest(searchVal);
		return SearchTdest;
	}

}
