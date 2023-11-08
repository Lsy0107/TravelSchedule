package com.TravelSchedule.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Review {
	private String recode;
	private String mid;
	private String recomment;
	private String retitle;
	private String rephoto;
	private String rehit;
	private String restate;
	private String cdcode;
	private String codelist;
	private String redate;
	private String relike;
	private String lknum;
	
	private MultipartFile[] profiledata;
}
