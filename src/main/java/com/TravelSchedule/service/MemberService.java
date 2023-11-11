package com.TravelSchedule.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.TravelSchedule.dao.MemberDao;
import com.TravelSchedule.dto.Member;

@Service
public class MemberService {

	@Autowired
	MemberDao mdao;

	public int memberJoin(Member mem) {
		System.out.println("MemberService - memberJoin");
		return mdao.insertMember(mem);
	}

	public Member setMprofile(Member meminfo, HttpSession session) {
		MultipartFile mprofiledata = meminfo.getMprofiledata();
		String mprofile = "";
		String savePath = "";
		// 첨부파일이 있을 경우 파일 이름과 경로를 설정
		UUID uuid = UUID.randomUUID();
		savePath = session.getServletContext().getRealPath("/resources/memberProfile");
		System.out.println(savePath);

		if (!mprofiledata.isEmpty()) {
			System.out.println("첨부파일 O");
			mprofile = uuid + "_" + mprofiledata.getOriginalFilename();
			File newFile = new File(savePath, mprofile);// File("경로", "파일이름")
			try {
				mprofiledata.transferTo(newFile);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} else {
			mprofile = "default.jpg";
		}

		meminfo.setMprofiledata(mprofiledata);
		meminfo.setMprofile(mprofile);
		return meminfo;
	}

	public String checkinfo(String info, String location) {
		System.out.println("MemberService - checkinfo");
		System.out.println(info);
		return mdao.selectInfo(info, location);
	}

	public Member memberLogin(Member mem) {
		System.out.println("MemberService - memberLogin");
		return mdao.selectMember(mem);
	}

	public Member getMemberInfo(String loginId) {
		System.out.println("MemberService - getMemberInfo");

		Member member = mdao.selectMemberInfo(loginId);

		return member;
	}

	public int memberInfo(Member mem, HttpSession session) {
		System.out.println("MemberService - memberInfo");

		MultipartFile mfile = mem.getMprofiledata();
		String mprofile = "";
		String savePath = session.getServletContext().getRealPath("/resources/memberProfile");

		if (!mfile.isEmpty()) {
			UUID uuid = UUID.randomUUID();
			String code = uuid.toString();
			System.out.println("code : " + code);
			mprofile = code + "_" + mfile.getOriginalFilename();

			System.out.println("savePath" + savePath);
			File newFile = new File(savePath, mprofile);
			try {
				mfile.transferTo(newFile);

			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		System.out.println("프로필 : " + mprofile);
		mem.setMprofile(mprofile);
		System.out.println(mem);

		int result = mdao.memberUpdate(mem);

		return result;
	}

	public int newPassword(String mid, String mpw) {
		System.out.println("MemberService - newPassword");

		return mdao.passwordUpdate(mid, mpw);
	}

	public Member LoginMemberInfo_kakao(String id) {
		System.out.println("LoginMemberInfo_kakao() 호출");

		return mdao.selectKakaoMemberInfo(id);
	}

	public int registMember_kakao(Member member) {
		System.out.println("registMember_Kakao() 호출");
		return mdao.regist_Kakao(member);
	}

	public Member CheckNaverLog(String mid) {
		System.out.println("CheckNaverLog() 호출");
		return mdao.CheckNaverLogin(mid);
	}

	public int registMember_Naver(Member member) {
		
		return mdao.registMemberInfo_Naver(member);
	}

	public ArrayList<Member> getMemberList(Member member) {
		System.out.println("getMemberList() - 호출");
		
		return mdao.selectMemberList(member);
	}

	public int memState(String mid) {
		System.out.println("memStateN - (호출)");
		return mdao.updateMstateNN(mid);
	}

	public int memStateY(String mid, String mpw) {
		System.out.println("memStateY - (호출)");
		if(mpw.equals("kakaoAccount")) {
			return mdao.updateMstateYK(mid);
		}else if(mpw.equals("naverAccount")) {
			return mdao.updateMstateNA(mid);
		}else {
			return mdao.updateMstateNY(mid);			
		}
	}
	

}
