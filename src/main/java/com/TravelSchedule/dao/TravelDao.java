package com.TravelSchedule.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.TravelSchedule.dto.Calendar;
import com.TravelSchedule.dto.Country;
import com.TravelSchedule.dto.Festival;
import com.TravelSchedule.dto.Review;
import com.TravelSchedule.dto.Schedule;
import com.TravelSchedule.dto.Tdest;

public interface TravelDao {

	Calendar selectCalendar_cdcode(@Param("mid")String mid, @Param("cdcode")String cdcode);
	
	ArrayList<Calendar> selectCalendar(@Param("mid")String mid);
	
	int insertCalendar(Calendar cd);

	String maxcode(String mid);

	ArrayList<Calendar> selectCdcode(String mid);

	int insertFKcode(@Param("sc")Schedule sc, @Param("seloption")String seloption);

	int updateSc(@Param("sc")Schedule sc, @Param("seloption")String seloption);

	ArrayList<HashMap<String, String>> select_sc_td_join(@Param("mid")String mid, @Param("cdcode")String cdcode);

	@Select("SELECT * FROM TDEST WHERE CTCODE = 'CT00001'")
	ArrayList<Tdest> TdestService();

	@Select("SELECT * FROM TDEST WHERE CTCODE = #{ctcode}")
	ArrayList<Tdest> CtTdestService(String ctcode);

	@Select("SELECT * FROM TDEST WHERE TDNAME LIKE '%'||#{searchVal}||'%'")
	HashMap<String, String> SearchTdest(String searchVal);

	Schedule selectSchedule(@Param("sc")Schedule sc, @Param("seloption")String seloption);

	int updateCdstate(@Param("mid")String mid, @Param("cdcode")String cdcode);

	int deleteCalender(Calendar cd);

	int deleteSchedule(Calendar cd);

	ArrayList<Schedule> getSchedule(Calendar cd);

	int deleteSchedule_dest(@Param("sc")Schedule sc, @Param("seloption")String seloption);
	
	@Select("select * from (select td.*,nvl(lknum, '0') lknum from tdest td left join (select tdcode, count(*) as lknum  from likelist group by tdcode ) lk on td.tdcode=lk.tdcode order by lknum desc) where tdcode = #{tdcode}")
	Tdest detailTdestDao(String tdcode);

	@Select("SELECT * FROM COUNTRY")	
	ArrayList<Country> CountryListDao();

	int insertFEcode(Schedule sc);

	ArrayList<Tdest> selectTdest_Nearby(@Param("ctcode")String ctcode,@Param("tdcode") String tdcode);

	ArrayList<Schedule> selectScList();

	ArrayList<Tdest> TravelSearchList(@Param("ctcode")String getctcode, @Param("category")String category);

	ArrayList<Festival> FestSearchList(@Param("ctcode")String getctcode, @Param("category")String category);

	@Select("SELECT CTCODE FROM COUNTRY WHERE CTNAME = #{ctcode}")
	String getctcodeD(String ctcode);

	int updateSchedule(@Param("sc")Schedule sc, @Param("scOption")String scOption);

	@Select("SELECT * FROM FESTIVAL WHERE FENAME LIKE '%'||#{searchVal}||'%'")
	ArrayList<Festival> FestList(String searchval);

	@Select("SELECT * FROM TDEST WHERE TDNAME LIKE '%'||#{searchVal}||'%'")
	ArrayList<Tdest> TdestList(String searchval);

	ArrayList<HashMap<String, String>> getPreview(@Param("searchInfo")String searchInfo, @Param("seloption")String seloption);

	@Select("SELECT COUNT(*) FROM REVIEW WHERE CODELIST LIKE '%'||#{tdcode}||'%'")
	String CountRe(String tdcode);

	Review selectReview(Calendar cd);

	int deleteLikeList(Review re);

	int deleteReview(Review re);


}
