package com.TravelSchedule.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.TravelSchedule.dto.Calendar;
import com.TravelSchedule.dto.Schedule;

public interface ReviewDao {

	@Select("SELECT * FROM CALENDAR") 
	ArrayList<Calendar> CalendarListDao();

	@Select("SELECT * FROM SCHEDULE WHERE CDCODE = #{cdcode}")
	ArrayList<Schedule> PrintScheduleDao(@Param("cdcode")String cdcode);

	@Select("SELECT TDNAME FROM SCHEDULE S,TDEST T WHERE S.TDCODE=T.TDCODE AND T.TDCODE = #{tdcode} AND CDCODE = #{cdcode}")
	String getTdNameSvc(@Param("tdcode")String tdcode, @Param("cdcode")String cdcode);

	@Select("SELECT FENAME FROM SCHEDULE S,FESTIVAL F WHERE S.FECODE = F.FECODE AND F.FECODE = #{fecode} AND CDCODE= #{cdcode}")
	String getFeNameSvc(@Param("fecode")String fecode, @Param("cdcode")String cdcode);


}
