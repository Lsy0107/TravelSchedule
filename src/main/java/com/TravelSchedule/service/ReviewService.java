package com.TravelSchedule.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.TravelSchedule.dao.ReviewDao;
import com.TravelSchedule.dto.Calendar;
import com.TravelSchedule.dto.Festival;
import com.TravelSchedule.dto.Likelist;
import com.TravelSchedule.dto.Review;
import com.TravelSchedule.dto.Schedule;
import com.TravelSchedule.dto.Tdest;

@Service
public class ReviewService {

	@Autowired
	ReviewDao rdao;

	public ArrayList<Calendar> CalendarList(String mid) {
		System.out.println("계획 출력 서비스");

		ArrayList<Calendar> CalendarListDao = rdao.CalendarListDao(mid);
		return CalendarListDao;
	}

	public ArrayList<Schedule> PrintSchedule(String cdcode, String mid) {
		System.out.println("PrintSchedule- 서비스 호출");

		ArrayList<Schedule> PrintScheduleDao = rdao.PrintScheduleDao(cdcode, mid);

		return PrintScheduleDao;
	}

	public String getTdName(String tdcode, String cdcode, String mid) {
		System.out.println("tdcode의 이름 조회서비스");

		String getTdNameSvc = rdao.getTdNameSvc(tdcode, cdcode, mid);
		return getTdNameSvc;
	}

	public String getFeName(String fecode, String cdcode, String mid) {
		System.out.println("fecode의 이름 조회서비스");

		String getFeNameSvc = rdao.getFeNameSvc(fecode, cdcode, mid);
		return getFeNameSvc;
	}

	public ArrayList<HashMap<String, String>> getTdInfo(String cdcode, String mid) {
		System.out.println("리뷰작성페이지 선택 계획 정보 서비스");

		ArrayList<HashMap<String, String>> getTdInfoDao = rdao.getTdInfoDao(cdcode, mid);
		return getTdInfoDao;
	}

	public ArrayList<HashMap<String, String>> getFeInfo(String cdcode, String mid) {
		System.out.println("리뷰작성페이지 선택 계획 정보 서비스");

		ArrayList<HashMap<String, String>> getFeInfoDao = rdao.getFeInfoDao(cdcode, mid);
		return getFeInfoDao;
	}

	public Review getPhoto(Review review,HttpSession session) {
		System.out.println("리뷰작성페이지 파일첨부 서비스");
		MultipartFile[] profiledata = review.getProfiledata();
		//System.out.println(profiledata);
		String photoFile = "";
		String savePath="";
		//첨부파일이 있을 경우 파일 이름과 경로를 설정 
		UUID uuid = UUID.randomUUID();
		savePath = session.getServletContext().getRealPath("/resources/ReviewPhoto");
	//	System.out.println(savePath);
		if(profiledata.length > 0) {
			System.out.println("첨부파일 O");
			
			for(int i=0; i<profiledata.length; i++) {	
				String filename = uuid+"_"+profiledata[i].getOriginalFilename();
				photoFile += uuid+"_"+profiledata[i].getOriginalFilename()+"/";
				System.out.println(photoFile);
				File newFile = new File(savePath, filename);//File("경로", "파일이름")
				try {
					profiledata[i].transferTo(newFile);
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			
		}else {
			System.out.println("첨부파일 x");
		}
		review.setProfiledata(profiledata);
		review.setRephoto(photoFile);
		return review;
	}

	public int ReviewInsert(Review review) {
		System.out.println("리뷰 등록 서비스");
    	
    	String recode = rdao.maxcode();
    	//String codeName = "RE";
		String codeName = recode.substring(0,2);
    	//int codeNum = Integer.parseInt(recode+1);
		int codeNum = Integer.parseInt(recode.substring(2))+1;
		String codeNum_String = String.format("%05d", codeNum);
		recode = codeName + codeNum_String;
		
    	System.out.println(recode);
    	review.setRecode(recode);
    	
    	int ReviewInsertDao = rdao.ReviewInsertDao(review);
		
		return ReviewInsertDao;
	}


	public int CalendarUpdate(String cdcode, String mid) {
		System.out.println("리뷰작성후 켈린더 상태 업데이트");
		
		int CalendarUpdateDao = rdao.CalendarUpdateDao(cdcode,mid);
		return CalendarUpdateDao;
	}

	public Calendar getCal(String cdcode, String mid) {
		// TODO Auto-generated method stub
		Calendar getCalD = rdao.getCalD(cdcode,mid);
		return getCalD;
	}

	public HashMap<String, String> getReview(String mid, String cdcode) {
		System.out.println("리뷰수정 페이지 -> 해당 리뷰 데이터 가져오기 서비스");
		
		HashMap<String,String> getReviewDao = rdao.getReviewDao(mid,cdcode);
		return getReviewDao;
	}

	public Tdest TdInfo(String s, String cdcode, String mid) {
		System.out.println("코드를 분리시킨뒤 여행지 정보 조회");
		Tdest TdInfoDao = rdao.TdInfoDao(s,cdcode,mid);
		return TdInfoDao;
	}

	public Festival FeInfo(String s, String cdcode, String mid) {
		System.out.println("코드를 분리시킨뒤 축제 정보 조회");
		
		Festival FeInfoDao = rdao.FeInfoDao(s,cdcode,mid);
		return FeInfoDao;
	}

	public int UpdateReview(String title, String contents, String recode, String mid) {
		
		int UpdateReviewDao = rdao.UpdateReviewDao(title,contents,recode,mid);
		return UpdateReviewDao;
	}

	public int DeleteReview(String cdcode, String mid) {
		
		int DeleteReviewDao = rdao.DeleteReview(cdcode,mid);
		return DeleteReviewDao;
	}

	public int UpdateCdState(String cdcode,String mid) {
		
		int UpdateCdState = rdao.UpdateCdState(cdcode,mid);
		return UpdateCdState;
	}

	public int CalendarCount(String mid) {
		
		return rdao.selectCalendarCount(mid);
	}

	public HashMap<String, String> reList(String recode) {
		
		return rdao.reList(recode);
	}

	public HashMap<String, String> getreList(String recode) {
		// TODO Auto-generated method stub
		return rdao.getreList(recode);
	}

	public int IncreaseRehit(String recode) {
		
		return rdao.IncreaseRehit(recode);
	}

	public int insertLike(String code, String mid) {
		// TODO Auto-generated method stub
		return rdao.insertLike(code,mid);
	}

	public int deleteLike(String code, String mid) {
		// TODO Auto-generated method stub
		return rdao.deleteLike(code,mid);
	}

	public Festival getFe(String cs) {
		// TODO Auto-generated method stub
		return rdao.getFe(cs);
	}

	public Tdest getTd(String cs) {
		// TODO Auto-generated method stub
		return rdao.getTd(cs);
	}
	


}
