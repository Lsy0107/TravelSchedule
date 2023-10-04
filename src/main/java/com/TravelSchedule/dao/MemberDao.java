package com.TravelSchedule.dao;

import org.apache.ibatis.annotations.Param;

import com.TravelSchedule.dto.Member;

public interface MemberDao {

	int insertMember(Member mem);

	String selectInfo(@Param("mid")String mid, @Param("mnickname")String mnickname);

}
