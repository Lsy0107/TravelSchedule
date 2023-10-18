package com.TravelSchedule.dao;

import org.apache.ibatis.annotations.Param;

import com.TravelSchedule.dto.Member;

public interface MemberDao {

	int insertMember(Member mem);

	String selectInfo(@Param("info")String info, @Param("location")String location);

	Member selectMember(Member mem);

	Member selectMemberInfo(String loginId);

	int memberUpdate(@Param("mid")String mid, @Param("mnickname")String mnickname);

	int passwordUpdate(@Param("mid")String mid, @Param("mpw")String mpw);

}
