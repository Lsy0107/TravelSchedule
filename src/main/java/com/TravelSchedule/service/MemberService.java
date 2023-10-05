package com.TravelSchedule.service;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.TravelSchedule.dao.MemberDao;
import com.TravelSchedule.dto.Member;

@Service
public class MemberService {

	@Autowired MemberDao mdao;
	
	public int memberJoin(Member mem) {
		System.out.println("MemberService - memberJoin");
		return mdao.insertMember(mem);
	}

	public Member setMprofile(Member meminfo, HttpSession session) {
		MultipartFile mprofiledata = meminfo.getMprofiledata();
		String mprofile = "";
		String savePath="";
		//첨부파일이 있을 경우 파일 이름과 경로를 설정 
		UUID uuid = UUID.randomUUID();
		savePath = session.getServletContext().getRealPath("/resources/memberProfile");
		System.out.println(savePath);
		if(!mprofiledata.isEmpty()) {
			System.out.println("첨부파일 O");
			mprofile = uuid+"_"+mprofiledata.getOriginalFilename();
			File newFile = new File(savePath, mprofile);//File("경로", "파일이름")
			try {
				mprofiledata.transferTo(newFile);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}else {
			mprofile = "default.jpg";
		}
		meminfo.setMprofiledata(mprofiledata);
		meminfo.setMprofile(mprofile);
		return meminfo;
	}

	public String checkinfo(String mid, String location) {
		System.out.println("MemberService - checkinfo");
		System.out.println(mid);
		return mdao.selectInfo(mid, location);
	}

}
