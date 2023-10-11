package com.TravelSchedule.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.TravelSchedule.dto.Calendar;
import com.TravelSchedule.dto.Schedule;
import com.TravelSchedule.dto.Tdest;

public interface TravelDao {

	ArrayList<Calendar> selectCalendar(@Param("mid")String mid);
	
	int insertCalendar(Calendar cd);

	String maxcode(String mid);

	ArrayList<Calendar> selectCdcode(String mid);

	int insertFKcode(Schedule sc);

	ArrayList<Schedule> selectSchedule(@Param("mid")String mid, @Param("cdcode")String cdcode);

	Tdest selectTdest(String tdcode);

	
}
