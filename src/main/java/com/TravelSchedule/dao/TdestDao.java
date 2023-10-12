package com.TravelSchedule.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Select;

import com.TravelSchedule.dto.Tdest;

public interface TdestDao {

	@Select("SELECT * FROM TDEST WHERE CTCODE = 'CT00001'")
	ArrayList<Tdest> TdestService();

	@Select("SELECT * FROM TDEST WHERE CTCODE = #{ctcode}")
	ArrayList<Tdest> CtTdestService(String ctcode);

	@Select("SELECT * FROM TDEST WHERE TDNAME LIKE '%'||#{searchVal}||'%'")
	ArrayList<Tdest> SearchTdest(String searchVal);

}
