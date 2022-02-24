package com.multi.lastproject.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.multi.lastproject.model.MemberVO;
import com.multi.lastproject.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	MemberService service;
	
	// 로그인 폼 이동
	@RequestMapping("/loginForm")
	public String loginForm() {
		return "/member/loginForm";
	}
	
	@ResponseBody
	@RequestMapping("/login")
	public String loginCheck(@RequestParam HashMap<String, Object> param,
											   HttpSession session) {
		
		// 로그인 체크 결과
		MemberVO vo = service.loginCheck(param);
		String result = "fail";
		
		if(vo != null) {
			// 로그인 성공하면 세션 변수 지정
			session.setAttribute("sid", vo.getMemId());
			session.setAttribute("sname", vo.getMemName());
			result = "success";
		}
		
		return result;
	}
	
	// 약관동의 폼 이동
	@RequestMapping("/consentForm")
	public String consentForm() {
		return "/member/consentForm";
	}
	
	// 회원가입 폼 이동
	@RequestMapping("/joinForm")
	public String joinForm() {
		return "/member/joinForm";
	}
	
	// 아이디 중복 체크
    @ResponseBody
	@RequestMapping("/memIdCheck")
	public String memIdCheck(@RequestParam String memId) {
	
		String memId_result=service.memIdCheck(memId);  
		String result="use";
		System.out.println(memId_result);
		if(memId_result == null) { 
			result="no_use";
		}else result="use";
		
		return result;
	}
    
    // 로그아웃
    @RequestMapping("/logout")
	   public String logout(HttpSession session) {
	      session.invalidate();
	      return "redirect:/";
	}
    
    // 회원가입
    @RequestMapping("/member/insertMember")
	public String insertMember(MemberVO vo) {
		service.insertMember(vo);
		return "redirect:/";
	}
    
    // 내정보로 이동
    @RequestMapping("/myinfoForm")
	public String myinfoForm() {
		return "/member/myinfoForm";
	}
    
    // 내정보관리로 이동
    @RequestMapping("/infoeditForm")
	public String infoeditForm() {
		return "/member/infoeditForm";
	}
    
    // 내정
    @RequestMapping("/infoedit/{memId}")
	public String memberInfo(@PathVariable String memId, Model model) {
		
		MemberVO mem = service.memberInfo(memId);
		model.addAttribute("mem", mem);
		
		return "member/infoeditForm";
	}
	
	// 정보 수정 : 수정된 정보 DB에 저장
	@RequestMapping("/member/infoeditForm")
	public String infoedit(MemberVO memId) {
		service.infoedit(memId);		
		return "redirect:/";
	}
	
	// 회원탈퇴로 이동
    @RequestMapping("/accountDelete")
	public String accountDeleteForm() {
		return "/member/accountDeleteForm";
	}
	
	// 회원탈퇴
    @ResponseBody
	@RequestMapping("/member/accountDelete")
	public int accountDelete(MemberVO vo, HttpSession session)
	{
		int result = service.accountDelete(vo);
		if(result != 0){
			session.invalidate();
			return result;
		}else{
			return 0;
		}
	}
	
}
