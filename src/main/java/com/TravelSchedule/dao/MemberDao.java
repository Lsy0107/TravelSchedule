package com.TravelSchedule.dao;

import com.TravelSchedule.dto.Member;

public interface MemberDao {

	int insertMember(Member mem);

	String selectInfo(String mid);

}
