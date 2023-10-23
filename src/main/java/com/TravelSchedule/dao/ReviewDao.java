package com.TravelSchedule.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.TravelSchedule.dto.Calendar;
import com.TravelSchedule.dto.Schedule;

public interface ReviewDao {

	@Select("SELECT * FROM CALENDAR WHERE CDSTATE = 'N' AND MID = #{mid}") 
	ArrayList<Calendar> CalendarListDao(String mid);

	@Select("SELECT * FROM SCHEDULE WHERE CDCODE = #{cdcode} AND MID = #{mid} AND SCDATE IS NOT NULL")
	ArrayList<Schedule> PrintScheduleDao(@Param("cdcode")String cdcode, @Param("mid")String mid);

	@Select("SELECT TDNAME FROM SCHEDULE S,TDEST T WHERE S.TDCODE=T.TDCODE AND T.TDCODE = #{tdcode} AND CDCODE = #{cdcode} AND MID = #{mid}")
	String getTdNameSvc(@Param("tdcode")String tdcode, @Param("cdcode")String cdcode, @Param("mid")String mid);

	@Select("SELECT FENAME FROM SCHEDULE S,FESTIVAL F WHERE S.FECODE = F.FECODE AND F.FECODE = #{fecode} AND CDCODE= #{cdcode} AND MID = #{mid}")
	String getFeNameSvc(@Param("fecode")String fecode, @Param("cdcode")String cdcode, @Param("mid")String mid);

	@Select("SELECT *\r\n"
			+ "FROM SCHEDULE S INNER JOIN TDEST T ON S.TDCODE = T.TDCODE\r\n"
			+ "WHERE MID = #{mid} AND S.CDCODE = #{cdcode} AND SCDATE IS NOT NULL")
	ArrayList<HashMap<String, String>> getTdInfoDao(@Param("cdcode")String cdcode, @Param("mid")String mid);

	@Select("SELECT *\r\n"
			+ "FROM SCHEDULE S INNER JOIN FESTIVAL F ON S.FECODE = F.FECODE\r\n"
			+ "WHERE MID = 'asd' AND SCDATE IS NOT NULL")
	ArrayList<HashMap<String, String>> getFeInfoDao(@Param("cdcode")String cdcode, @Param("mid")String mid);


}
