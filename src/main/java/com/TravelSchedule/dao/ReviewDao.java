package com.TravelSchedule.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.TravelSchedule.dto.Calendar;
import com.TravelSchedule.dto.Festival;
import com.TravelSchedule.dto.Review;
import com.TravelSchedule.dto.Schedule;
import com.TravelSchedule.dto.Tdest;

public interface ReviewDao {

	@Select("SELECT * FROM CALENDAR WHERE CDSTATE != 'Y' AND MID = #{mid}") 
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
			+ "WHERE MID = #{mid} AND S.CDCODE = #{cdcode} AND SCDATE IS NOT NULL")
	ArrayList<HashMap<String, String>> getFeInfoDao(@Param("cdcode")String cdcode, @Param("mid")String mid);

	@Select("SELECT NVL(MAX(RECODE),'RE00000') FROM REVIEW")
	String maxcode();

	@Insert("INSERT INTO REVIEW VALUES(#{recode},#{mid},#{recomment},#{retitle},#{rephoto},0,'Y',#{cdcode},#{codelist})")
	int ReviewInsertDao(Review review);


	@Update("UPDATE CALENDAR SET CDSTATE = 'R' WHERE CDCODE = #{cdcode} AND MID = #{mid}")
	int CalendarUpdateDao(@Param("cdcode")String cdcode, @Param("mid")String mid);

	@Select("SELECT * FROM CALENDAR WHERE CDCODE = #{cdcode} AND MID = #{mid}")
	Calendar getCalD(@Param("cdcode")String cdcode, @Param("mid")String mid);

	@Select("SELECT *\r\n"
			+ "FROM CALENDAR C, REVIEW R\r\n"
			+ "WHERE C.CDCODE = R.CDCODE AND C.CDCODE = #{cdcode} AND C.MID = #{mid}")
	HashMap<String, String> getReviewDao(@Param("mid")String mid, @Param("cdcode")String cdcode);

	@Select("SELECT *\r\n"
			+ "FROM TDEST T, SCHEDULE S\r\n"
			+ "WHERE T.TDCODE = S.TDCODE AND T.TDCODE = #{s} AND CDCODE = #{cdcode} AND MID = #{mid} AND SCDATE IS NOT NULL")
	Tdest TdInfoDao(@Param("s")String s, @Param("cdcode")String cdcode, @Param("mid")String mid);

	@Select("SELECT *\r\n"
			+ "FROM FESTIVAL F, SCHEDULE S\r\n"
			+ "WHERE F.FECODE = S.FECODE AND F.FECODE = #{s} AND CDCODE = #{cdcode} AND MID = #{mid} AND SCDATE IS NOT NULL")
	Festival FeInfoDao(@Param("s")String s,@Param("cdcode")String cdcode, @Param("mid")String mid);

	@Update("UPDATE REVIEW SET RETITLE = #{title}, RECOMMENT = #{contents} WHERE RECODE = #{recode} AND MID = #{mid}")
	int UpdateReviewDao(@Param("title")String title, @Param("contents")String contents, @Param("recode")String recode, @Param("mid")String mid);

	@Delete("DELETE FROM REVIEW WHERE MID = #{mid} AND CDCODE = #{cdcode}")
	int DeleteReview(@Param("cdcode")String cdcode, @Param("mid")String mid);

	@Update("UPDATE CALENDAR SET CDSTATE = 'N' WHERE MID = #{mid} AND CDCODE = #{cdcode}")
	int UpdateCdState(@Param("cdcode")String cdcode, @Param("mid")String mid);


}
