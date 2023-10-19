package com.TravelSchedule.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.TravelSchedule.dto.Calendar;
import com.TravelSchedule.dto.Schedule;

public interface ReviewDao {

	@Select("SELECT * FROM CALENDAR") 
	ArrayList<Calendar> CalendarListDao();

	ArrayList<Schedule> PrintScheduleDao(@Param("cdcode")String cdcode,@Param("tdcode") String tdcode,@Param("fecode") String fecode);

	@Select("SELECT CDNAME, TDCODE,FECODE,C.CDCODE\r\n"
			+ "FROM CALENDAR C LEFT OUTER JOIN SCHEDULE S ON S.CDCODE = C.CDCODE")
	Calendar Rr();

}
