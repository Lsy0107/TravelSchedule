package com.TravelSchedule.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.TravelSchedule.dto.Calendar;
import com.TravelSchedule.dto.Schedule;
import com.TravelSchedule.dto.Tdest;

public interface TravelDao {

	ArrayList<Calendar> selectCalendar(@Param("mid")String mid);
	
	int insertCalendar(Calendar cd);

	String maxcode(String mid);

	ArrayList<Calendar> selectCdcode(String mid);

	int insertFKcode(Schedule sc);

	int updateSc(@Param("sc")Schedule sc, @Param("seloption")String seloption);

	ArrayList<HashMap<String, String>> select_sc_td_join(@Param("mid")String mid, @Param("cdcode")String cdcode);

	@Select("SELECT * FROM TDEST WHERE CTCODE = 'CT00001'")
	ArrayList<Tdest> TdestService();

	@Select("SELECT * FROM TDEST WHERE CTCODE = #{ctcode}")
	ArrayList<Tdest> CtTdestService(String ctcode);

	@Select("SELECT * FROM TDEST WHERE TDNAME LIKE '%'||#{searchVal}||'%'")
	ArrayList<Tdest> SearchTdest(String searchVal);
}
