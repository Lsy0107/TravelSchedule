package com.TravelSchedule.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.TravelSchedule.dto.Country;
import com.TravelSchedule.dto.Festival;
import com.TravelSchedule.dto.Likelist;
import com.TravelSchedule.dto.Review;
import com.TravelSchedule.dto.Tdest;

public interface ApiDao {

	String selectCtcode(@Param("ctname")String addr1);

	String maxcode(@Param("seloption")String seloption);

	void insertTdest(Tdest tdest);

	String selectTdcode(@Param("tdname")String tdname);

	ArrayList<Tdest> selectTdest();

	String selectFecode(@Param("fename")String fename);

	void insertFestival(Festival festival);

	ArrayList<Country> selectCountry();
	
	ArrayList<Festival> selectFestival();

	ArrayList<Festival> selectFestival_country(@Param("ctcode")String ctcode);

	ArrayList<Festival> selectFestival_db();

	Festival selectFestival_detail(@Param("code")String code);

	ArrayList<Festival> selectFestival_Nearby(@Param("ctcode")String ctcode, @Param("fecode")String fecode);

	String selectCountry_this(@Param("ctcode") String ctcode);

	ArrayList<Festival> selectSearchFestival(@Param("searchVal") String searchVal);

	String maxcode_lk();

	Likelist selectLK(@Param("lk") Likelist lk, @Param("seloption") String seloption);

	int insertLK(@Param("lk") Likelist lk, @Param("seloption") String seloption);

	int deleteLK(@Param("lk") Likelist lk, @Param("seloption") String seloption);

	@Select("SELECT * FROM REVIEW R, MEMBERS M WHERE M.MID = R.MID")
	ArrayList<HashMap<String, String>> reListDao();

	@Select("SELECT * FROM REVIEW R WHERE CODELIST LIKE '%'||#{cs}||'%'")
	Review getReDao(String cs);

	ArrayList<Likelist> selectlikeList_td(@Param("mid") String mid);

	Tdest selectTd(@Param("tdcode") String tdcode);

	ArrayList<Likelist> selectlikeList_fe(@Param("mid") String mid);

	Festival selectFe(@Param("fecode") String fecode);

	ArrayList<Likelist> selectlikeList_re(@Param("mid") String mid);

	Review selectReview(@Param("recode") String recode);

	String selectLknum(@Param("code") String code, @Param("seloption") String seloption);

	String selectDate(@Param("code") String code);

	@Select("SELECT COUNT(*) FROM REVIEW WHERE CODELIST LIKE '%'||#{code}||'%'")
	String CountReFe(String code);
	
}
