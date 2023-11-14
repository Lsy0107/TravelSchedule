package com.TravelSchedule.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.TravelSchedule.dto.Member;

public interface MemberDao {

	int insertMember(Member mem);

	String selectInfo(@Param("info")String info, @Param("location")String location);

	Member selectMember(Member mem);

	Member selectMemberInfo(String loginId);

	int memberUpdate(Member mem);

	int passwordUpdate(Member mem);

	@Select("SELECT * FROM MEMBERS WHERE MID = #{id}")
	Member selectKakaoMemberInfo(String id);

	@Insert("INSERT INTO MEMBERS(MID, MPW, MNICKNAME, MPROFILE, MSTATE) VALUES( #{mid}, 'kakaoAccount', #{mnickname}, #{mprofile}, 'YK')")
	int regist_Kakao(Member member);

	@Select("SELECT * FROM MEMBERS WHERE MID = #{mid}")
	Member CheckNaverLogin(String mid);

	@Insert("INSERT INTO MEMBERS(MID, MPW, MNICKNAME, MPROFILE, MSTATE) VALUES(#{mid}, 'naverAccount', #{mnickname}, #{mprofile}, 'NA')")
	int registMemberInfo_Naver(Member member);

	ArrayList<Member> selectMemberList(Member member);
	
	@Update("UPDATE MEMBERS SET MSTATE = 'NN' WHERE mid = #{mid}")
	int updateMstateNN(String mid);
	@Update("UPDATE MEMBERS SET MSTATE = 'NY' WHERE mid = #{mid}")
	int updateMstateNY(String mid);
	@Update("UPDATE MEMBERS SET MSTATE = 'YK' WHERE mid = #{mid}")
	int updateMstateYK(String mid);
	@Update("UPDATE MEMBERS SET MSTATE = 'NA' WHERE mid = #{mid}")
	int updateMstateNA(String mid);
	@Update("UPDATE MEMBERS SET MSTATE = 'AD' WHERE mid = #{mid}")
	int updateMstateAD(String mid);
	

}
