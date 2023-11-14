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
import com.TravelSchedule.dto.Likelist;
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

	@Insert("INSERT INTO REVIEW(RECODE,MID,RECOMMENT,RETITLE,REPHOTO,REHIT,RESTATE,CDCODE,CODELIST,REDATE,RELIKE) VALUES(#{recode},#{mid},#{recomment},#{retitle},#{rephoto},0,'Y',#{cdcode},#{codelist},SYSDATE,0)")
	int ReviewInsertDao(Review review);


	@Update("UPDATE CALENDAR SET CDSTATE = 'R' WHERE CDCODE = #{cdcode} AND MID = #{mid}")
	int CalendarUpdateDao(@Param("cdcode")String cdcode, @Param("mid")String mid);

	@Select("SELECT * FROM CALENDAR WHERE CDCODE = #{cdcode} AND MID = #{mid}")
	Calendar getCalD(@Param("cdcode")String cdcode, @Param("mid")String mid);

	@Select("SELECT *\r\n"
			+ "FROM CALENDAR C, REVIEW R\r\n"
			+ "WHERE C.CDCODE = R.CDCODE AND C.MID = #{mid} AND R.MID = #{mid} AND C.CDCODE = #{cdcode}")
	HashMap<String, String> getReviewDao(@Param("mid")String mid, @Param("cdcode")String cdcode);

	@Select("SELECT *\r\n"
			+ "FROM TDEST T, SCHEDULE S\r\n"
			+ "WHERE T.TDCODE = S.TDCODE AND T.TDCODE = #{s} AND CDCODE = #{cdcode} AND MID = #{mid} AND SCDATE IS NOT NULL")
	Tdest TdInfoDao(@Param("s")String s, @Param("cdcode")String cdcode, @Param("mid")String mid);

	@Select("SELECT *\r\n"
			+ "FROM FESTIVAL F, SCHEDULE S\r\n"
			+ "WHERE F.FECODE = S.FECODE AND F.FECODE = #{s} AND CDCODE = #{cdcode} AND MID = #{mid} AND SCDATE IS NOT NULL")
	Festival FeInfoDao(@Param("s")String s,@Param("cdcode")String cdcode, @Param("mid")String mid);

	@Update("UPDATE REVIEW SET RETITLE = #{retitle}, RECOMMENT = #{recomment}, CODELIST = #{codelist}, REPHOTO = #{rephoto} WHERE RECODE = #{recode} AND MID = #{mid}")
	int UpdateReviewDao(Review review);

	@Delete("DELETE FROM REVIEW WHERE MID = #{mid} AND CDCODE = #{cdcode}")
	int DeleteReview(@Param("cdcode")String cdcode, @Param("mid")String mid);

	@Update("UPDATE CALENDAR SET CDSTATE = 'N' WHERE MID = #{mid} AND CDCODE = #{cdcode}")
	int UpdateCdState(@Param("cdcode")String cdcode, @Param("mid")String mid);

	@Select("SELECT COUNT(*) FROM REVIEW WHERE MID = #{mid} AND RESTATE = 'Y'")
	int selectCalendarCount(@Param("mid") String mid);

	@Select("SELECT * FROM REVIEW WHERE RECODE = #{recode}")
	HashMap<String, String> reList(String recode);

	@Select("select RECODE,MID,RECOMMENT,RETITLE,REPHOTO,REHIT,RESTATE,CDCODE,CODELIST,TO_CHAR(REDATE,'YYYY/MM/DD HH24:MI') AS REDATE,LKNUM from (select re.*,nvl(lknum, '0') lknum from review re left join (select recode, count(*) as lknum  from likelist group by recode ) lk on re.recode=lk.recode order by lknum desc) where recode = #{recode}")
	HashMap<String, String> getreList(String recode);

	@Update("UPDATE REVIEW SET REHIT = REHIT + 1 WHERE RECODE = #{recode}")
	int IncreaseRehit(String recode);

	@Update("UPDATE REVIEW SET RELIKE = RELIKE + 1 WHERE RECODE = #{code} AND MID = #{mid}")
	int insertLike(@Param("code")String code, @Param("mid")String mid);

	@Update("UPDATE REVIEW SET RELIKE = RELIKE - 1 WHERE RECODE = #{code} AND MID = #{mid}")
	int deleteLike(String code, String mid);

	@Select("SELECT * FROM FESTIVAL WHERE FECODE = #{cs}")
	Festival getFe(String cs);

	@Select("SELECT * FROM TDEST WHERE TDCODE = #{cs}")
	Tdest getTd(String cs);
	
	@Select("SELECT * FROM REVIEW WHERE MID = #{mid}")
	ArrayList<Review> selectReview(String mid);
	
	@Select("SELECT * FROM REVIEW")
	ArrayList<Review> selReviewList(Review review);
	
	
	@Delete("DELETE FROM REVIEW WHERE MID = #{mid} AND RECODE = #{recode}")
	int deleteReview(Review review);
	@Delete("DELETE FROM LIKELIST WHERE MID = #{mid} AND RECODE = #{recode}")
	int deleteLikeList(Review review);
	@Select("select * FROM LIKELIST WHERE MID = #{mid} AND RECODE = #{recode}")
	Review selectLikeList(Review review);

	@Select("SELECT  recode, mid, retitle, rehit, lknum, CASE WHEN to_char(redate, 'YYYY/MM/DD') >= to_char(sysdate, 'YYYY/MM/DD') THEN to_char(redate, 'hh24:mm') ELSE to_char(redate, 'MM-DD') END as REDATE, relike FROM (select re.*,nvl(lknum, '0') lknum from review re left join (select recode, count(*) as lknum  from likelist group by recode ) lk on re.recode=lk.recode order by lknum desc) where restate = 'Y' order by redate desc")
	ArrayList<Review> selectAllReview();

	@Select("SELECT  recode, mid, retitle, rehit, lknum, CASE WHEN to_char(redate, 'YYYY/MM/DD') >= to_char(sysdate, 'YYYY/MM/DD') THEN to_char(redate, 'hh24:mm') ELSE to_char(redate, 'MM-DD') END as REDATE, relike FROM (select re.*,nvl(lknum, '0') lknum from review re left join (select recode, count(*) as lknum  from likelist group by recode ) lk on re.recode=lk.recode order by lknum desc) where restate = 'Y' order by lknum desc")
	ArrayList<Review> selectBestReview();

	@Select("SELECT  recode, mid, retitle, rehit, lknum, CASE WHEN to_char(redate, 'YYYY/MM/DD') >= to_char(sysdate, 'YYYY/MM/DD') THEN to_char(redate, 'hh24:mm') ELSE to_char(redate, 'MM-DD') END as REDATE, relike FROM (select re.*,nvl(lknum, '0') lknum from review re left join (select recode, count(*) as lknum  from likelist group by recode ) lk on re.recode=lk.recode order by lknum desc) where restate = 'Y' and retitle like '%'||#{retitle}||'%' order by lknum desc")
	ArrayList<Review> selectSearchReview(String retitle);



}
