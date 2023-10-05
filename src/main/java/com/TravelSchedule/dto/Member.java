package com.TravelSchedule.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Member {
	private String mid;
	private String mpw;
	private String mnickname;
	private String mprofile;
	private String mstate;
	
	private MultipartFile mprofiledata;
}
