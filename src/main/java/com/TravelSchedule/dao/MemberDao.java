package com.TravelSchedule.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;

import com.TravelSchedule.dto.Member;

public interface MemberDao {

	int insertMember(Member mem);

	String selectInfo(@Param("info")String info, @Param("location")String location);

	Member selectMember(Member mem);

	Member selectMemberInfo(String loginId);

	int memberUpdate(Member mem);

	int passwordUpdate(@Param("mid")String mid, @Param("mpw")String mpw);

}
