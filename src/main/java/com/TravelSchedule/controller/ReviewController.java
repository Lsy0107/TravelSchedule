package com.TravelSchedule.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.TravelSchedule.dto.Calendar;
import com.TravelSchedule.dto.Festival;
import com.TravelSchedule.dto.Likelist;
import com.TravelSchedule.dto.Review;
import com.TravelSchedule.dto.Schedule;
import com.TravelSchedule.dto.Tdest;
import com.TravelSchedule.service.ApiService;
import com.TravelSchedule.service.ReviewService;
import com.google.gson.Gson;

@Controller
public class ReviewController {

	@Autowired
	ReviewService rsvc;
	@Autowired
	ApiService apisvc;

	@RequestMapping(value = "/TravelReview")
	public ModelAndView TravelReview(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		System.out.println("여행 리뷰 작성 페이지 이동");

		String mid = (String) session.getAttribute("loginId");
		System.out.println("현재 아이디 : " + mid);

		ArrayList<Calendar> CalendarList = rsvc.CalendarList(mid);
		int count = rsvc.CalendarCount(mid);
//		Review ReviewList = rsvc.ReviewList(mid);
//		System.out.println(ReviewList);
//		mav.addObject("Re",ReviewList);
		mav.addObject("count", count);
		String select = "border-left: thick solid red;";
		mav.addObject("sel", select);
		mav.addObject("Cal", CalendarList);
		mav.setViewName("review/TravelReview");
		return mav;
	}

	@RequestMapping(value = "PrintSchedule")
	public @ResponseBody String PrintSchedule(String cdcode, HttpSession session) {

		String mid = (String) session.getAttribute("loginId");

		ArrayList<Schedule> PrintSchedule = rsvc.PrintSchedule(cdcode, mid);
		System.out.println(PrintSchedule);
		return new Gson().toJson(PrintSchedule);
	}

	@RequestMapping(value = "getTdName")
	public @ResponseBody String getTdName(String tdcode, String cdcode, HttpSession session) {

		String mid = (String) session.getAttribute("loginId");
		System.out.println("현재 아이디 : " + mid);

		String getTdName = rsvc.getTdName(tdcode, cdcode, mid);
		return new Gson().toJson(getTdName);
	}

	@RequestMapping(value = "getFeName")
	public @ResponseBody String getFeName(String fecode, String cdcode, HttpSession session) {

		String mid = (String) session.getAttribute("loginId");
//		System.out.println("현재 아이디 : "+mid);

		String getFeName = rsvc.getFeName(fecode, cdcode, mid);
//		System.out.println(getFeName);
		return new Gson().toJson(getFeName);
	}

	// 리뷰작성페이지 이동
	@RequestMapping(value = "ReviewWriteForm")
	public ModelAndView ReviewWriteForm(String cdcode, HttpSession session) {
		System.out.println("리뷰작성페이지 이동");
		System.out.println("받아온 cdcode : " + cdcode);
		ModelAndView mav = new ModelAndView();
		String mid = (String) session.getAttribute("loginId");

		ArrayList<HashMap<String, String>> getTdInfo = rsvc.getTdInfo(cdcode, mid);
		ArrayList<HashMap<String, String>> getFeInfo = rsvc.getFeInfo(cdcode, mid);
		Calendar getCal = rsvc.getCal(cdcode, mid);
//		System.out.println(getCal);

		mav.addObject("Cl", getCal);
		mav.addObject("Td", getTdInfo);
		mav.addObject("Fe", getFeInfo);
		mav.setViewName("review/ReviewWriteForm");
		return mav;
	}

	@RequestMapping(value = "InsertReview")
	public @ResponseBody ModelAndView InsertReview(Review review, String title, String contents, String codeList,
			String cdcode, HttpSession session) {
		System.out.println("리뷰 작성 호출");
		System.out.println("받아온 title : " + title);
		System.out.println("받아온 contents : " + contents);
		System.out.println("받아온 codeList : " + codeList);
		System.out.println("받아온 cdcode : " + cdcode);
		ModelAndView mav = new ModelAndView();
		String mid = (String) session.getAttribute("loginId");

		Review photo = rsvc.getPhoto(review, session);
//		System.out.println(photo);

		review.setMid(mid);
		review.setRecomment(contents);
		review.setRetitle(title);
		review.setCdcode(cdcode);
		review.setCodelist(codeList);
		int ReviewInsert = rsvc.ReviewInsert(review);
		System.out.println("여까지는 되냐");
		int CalendarUpdate = rsvc.CalendarUpdate(cdcode, mid);
		if (ReviewInsert > 0) {
			System.out.println("등록 성공");
			mav.setViewName("redirect:/");
		} else {
			System.out.println("등록 실패");
		}

		return mav;
	}

	@RequestMapping(value = "ReviewFix")
	public ModelAndView ReviewFix(String cdcode, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		System.out.println("리뷰 수정 페이지 이동");
		System.out.println("받아온 cdcode : " + cdcode);

		String mid = (String) session.getAttribute("loginId");

		HashMap<String, String> getReview = rsvc.getReview(mid, cdcode);
		System.out.println("오류찾기 : " + getReview);
//		System.out.println(getReview);
		String getName = (String) getReview.get("CODELIST"); // codeList의 값 분류
		System.out.println("키값 : " + getName);

		String getRephoto = (String) getReview.get("REPHOTO");
		System.out.println("사진들 : " + getRephoto);

		ArrayList<Tdest> TdList = new ArrayList<>();
		ArrayList<Festival> FeList = new ArrayList<>();

		String[] codes = getName.split("/");
		for (String s : codes) {
			System.out.println("코드 분류 : " + s);

//			System.out.println(s.contains("TD"));

			if (s.contains("TD") == true) { // 여행지코드 축제코드중 여행지 코드에 포함된 TD가 있을경우 boolean true
				Tdest TdInfo = rsvc.TdInfo(s, cdcode, mid);
//				System.out.println(TdInfo);
				TdList.add(TdInfo);
			} else {
				Festival FeInfo = rsvc.FeInfo(s, cdcode, mid);
//				System.out.println(FeInfo);
				FeList.add(FeInfo);
			}

		}
		ArrayList<String> PhotoList = new ArrayList<>();
		String[] photoes = getRephoto.split("/");
		for (String p : photoes) {
			PhotoList.add(p);
		}
		System.out.println(TdList);
		System.out.println("사진 분류 : " + PhotoList);

		mav.addObject("Ph", PhotoList);
		mav.addObject("Td", TdList);
		mav.addObject("Fe", FeList);
		mav.addObject("getRe", getReview);
		mav.setViewName("review/ReviewFix");
		return mav;
	}

	@RequestMapping(value = "UpdateReview")
	public @ResponseBody String UpdateReview(String title, String contents, String recode, HttpSession session) {
		System.out.println("리뷰 수정 컨트롤러 호출");
		System.out.println("받아온 데이터 : " + title + "|" + contents + "|" + recode);
		String mid = (String) session.getAttribute("loginId");
		int UpdateReview = rsvc.UpdateReview(title, contents, recode, mid);

		return new Gson().toJson(UpdateReview);
	}

	@RequestMapping(value = "DeleteReview")
	public @ResponseBody String DeleteReview(String cdcode, HttpSession session) {
		System.out.println("리뷰 삭제 컨트롤러 호출");
		String mid = (String) session.getAttribute("loginId");
		int DeleteReview = rsvc.DeleteReview(cdcode, mid);
		int UpdateCdState = rsvc.UpdateCdState(cdcode, mid);
		return new Gson().toJson(DeleteReview);
	}

	@RequestMapping(value = "detailReview")
	public ModelAndView detailReview(String recode, HttpSession session) {
		System.out.println("리뷰 상세보기 페이지 이동");
		ModelAndView mav = new ModelAndView();
		System.out.println("받아온 recode : " + recode);
		HashMap<String, String> getreList = rsvc.getreList(recode);

		ArrayList<Tdest> TdList = new ArrayList<>();
		ArrayList<Festival> FeList = new ArrayList<>();
		ArrayList<String> PhotoList = new ArrayList<>();

		HashMap<String, String> reList = rsvc.reList(recode);
		String id = reList.get("MID");

		String codeList = (String) reList.get("CODELIST");
		String[] codeSplit = codeList.split("/");
		for (String cs : codeSplit) { // cs => codeList를 /로 나눈 코드들
			System.out.println(cs);
			if (cs.contains("FE")) {
				Festival Fe = rsvc.getFe(cs);
				FeList.add(Fe);
			} else if (cs.contains("TD")) {
				Tdest Td = rsvc.getTd(cs);
				TdList.add(Td);
			}
		}
		String getRephoto = (String) reList.get("REPHOTO");
		System.out.println("사진들 : " + getRephoto);

		String[] photoes = getRephoto.split("/");
		for (String p : photoes) {
			PhotoList.add(p);
		}
		System.out.println("사진 분류 : " + PhotoList);

		System.out.println(reList);
		String CurrentLogId = (String) session.getAttribute("loginId");
		if (!(id.equals(CurrentLogId))) {
			int IncreaseRehit = rsvc.IncreaseRehit(recode);
		}

		if (session.getAttribute("loginId") != null) {
			Likelist lk = new Likelist();
			lk.setRecode(recode);
			lk.setMid((String) session.getAttribute("loginId"));
			System.out.println("오류ㅠ제발 : " + lk.getRecode());
			String seloption = "review";
			// System.out.println(codeName);
			System.out.println(lk);
			String Like = apisvc.getLikelist(lk, seloption);
			mav.addObject("like", Like);
		}
		System.out.println(getreList);
		mav.addObject("Re", getreList);
		mav.addObject("Ph", PhotoList);
		mav.addObject("TdList", TdList);
		mav.addObject("FeList", FeList);
		mav.addObject("reList", reList);
		System.out.println("TdList:" + TdList);
		mav.setViewName("review/DetailReview");
		return mav;
	}

}
