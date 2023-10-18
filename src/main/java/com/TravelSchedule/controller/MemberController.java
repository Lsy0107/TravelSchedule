package com.TravelSchedule.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.TravelSchedule.dto.Member;
import com.TravelSchedule.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	MemberService msvc;
	
	@RequestMapping(value="/memberLogout")
	public ModelAndView memberLogout(HttpSession session) {
		System.out.println("로그아웃 요청");
		ModelAndView mav = new ModelAndView();
		session.removeAttribute("loginId");
		session.removeAttribute("loginProfile");
		mav.setViewName("redirect:/");
		return mav;
	}
	
	@RequestMapping(value="/memberLogin")
	public ModelAndView memberLogin(Member mem, HttpSession session) {
		System.out.println("로그인 요청");
		ModelAndView mav = new ModelAndView();
		Member rs = msvc.memberLogin(mem);
		if(rs == null) {
			mav.setViewName("redirect:memberLoginForm");
		}else {
			session.setAttribute("loginId", rs.getMid());
			session.setAttribute("loginProfile", rs.getMprofile());
			mav.setViewName("redirect:/");
		}
		return mav;
	}
	
	@RequestMapping(value="/memberJoin")
	public ModelAndView memberJoin(Member meminfo, HttpSession session) {
		System.out.println("회원가입 요청");
		ModelAndView mav = new ModelAndView();
		Member mem = msvc.setMprofile(meminfo, session);
		System.out.println(mem);
		int rs = msvc.memberJoin(meminfo);
		if(rs>0) {
			mav.setViewName("redirect:/");
		}else {
			mav.setViewName("redirect:/memberJoinForm");
		}
		return mav;
	}
	
	@RequestMapping(value="/checkInfo")
	public @ResponseBody String idCheck(String info, String location) {
		System.out.println("아이디/닉네임 중복체크 요청");
		String rs = msvc.checkinfo(info, location);
		System.out.println("rs"+rs);
		return rs;
	}
	
	@RequestMapping(value = "/myInfo")
	public ModelAndView myInfo(HttpSession session) {
		System.out.println("내정보 조회 요청");
		ModelAndView mav = new ModelAndView();
		
		String loginId = (String)session.getAttribute("loginId");
		System.out.println("조회 할 아이디 : " + loginId);
		
		Member member = msvc.getMemberInfo(loginId);
		System.out.println(member);

		mav.addObject("mInfo", member);
		mav.setViewName("member/myInfo");
		return mav;
	}
	
	@RequestMapping(value = "/memberUpdate")
	public ModelAndView memberUpdate(String mid, String mnickname, RedirectAttributes ra) {
		System.out.println("회원정보 수정 요청");
		ModelAndView mav = new ModelAndView();
		System.out.println("수정할 아이디 : " + mid);
		System.out.println("수정할 닉네임 : " + mnickname);
		
		int memInfo = msvc.memberInfo(mid, mnickname);
		
		if(memInfo > 0) {
			mav.setViewName("redirect:/myInfo");
			ra.addFlashAttribute("msg", "회원정보가 수정되었습니다.");
		}else {
			mav.setViewName("redirect:/myInfo");
			ra.addFlashAttribute("msg", "회원정보 수정에 실패하였습니다.");
		}
		
		return mav;
	}
	
	@RequestMapping(value = "/updatePw")
	public ModelAndView updatePw(String mid, String mpw, RedirectAttributes ra) {
		System.out.println("회원정보 수정 요청");
		ModelAndView mav = new ModelAndView();
		System.out.println("수정할 아이디 : " + mid);
		System.out.println("수정할 비밀번호 : " + mpw);
		
		int memInfo = msvc.newPassword(mid, mpw);
		
		if(memInfo > 0) {
			mav.setViewName("redirect:/myInfo");
			ra.addFlashAttribute("msg", "비밀번호가 변경되었습니다.");
		}else {
			mav.setViewName("redirect:/myInfo");
			ra.addFlashAttribute("msg", "비밀번호 변경에 실패하였습니다.");
		}
		
		return mav;
	}
	
	
}
