package com.multi.lastproject.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.multi.lastproject.model.ClothsProductVO;
import com.multi.lastproject.model.FoodProductVO;
import com.multi.lastproject.model.MemberVO;
import com.multi.lastproject.model.OrderInfoVO;
import com.multi.lastproject.model.OrderProductVO;
import com.multi.lastproject.model.ReviewVO;
import com.multi.lastproject.service.BoardService;
import com.multi.lastproject.service.CartService;
import com.multi.lastproject.service.MemberService;
import com.multi.lastproject.service.ProductService;

@Controller
public class MemberController {
	@Autowired
	MemberService service;
	@Autowired
	CartService cartservice;
	@Autowired
	ProductService prdservice;
	@Autowired
	BoardService service2;

	

	// 로그인 폼 이동
	@RequestMapping("/loginForm")
	public String loginForm() {
		return "/member/loginForm";
	}
	
	@ResponseBody
	@RequestMapping("/login")
	public String loginCheck(@RequestParam HashMap<String, Object> param,
											   HttpSession session,HttpServletResponse response) {
		
		// 로그인 체크 결과
		MemberVO vo = service.loginCheck(param);
		String result = "fail";
		if(vo != null) {
			// 로그인 성공하면 세션 변수 지정
			session.setAttribute("sid", vo.getMemId());
			session.setAttribute("sname", vo.getMemName());
			result = "success";
			String []address=vo.getMemAddress().split(" ");
			session.setAttribute("saddress", address[0]);
			System.out.println(address[0]);
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
    
	/*  // 내정보로 이동
	@RequestMapping("/myinfoForm")
	public String myinfoForm() {
		return "/member/myinfoForm";
	}*/
    
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

	@RequestMapping("/member/myorderInfo")
	public String myorderInfo(Model model,HttpSession session) {
		String memId=(String)session.getAttribute("sid");
		ArrayList<OrderInfoVO> ordInfoList=cartservice.orderInfoList(memId);
		ArrayList<OrderProductVO> ordProductList=cartservice.orderProductList(memId);
		ArrayList<FoodProductVO> Alllist=prdservice.Alllist();
		ArrayList<ClothsProductVO> cloAlllist=prdservice.cloAlllist();
		model.addAttribute("ordProductList", ordProductList);
		model.addAttribute("ordInfoList", ordInfoList);
		model.addAttribute("Alllist", Alllist);
		model.addAttribute("cloAlllist", cloAlllist);
		return "/member/myorderInfo";
	}

    
    // 내 리뷰 리스트
 	@RequestMapping("/myreviewList")
 	public String myreviewList( Model model, HttpSession session) {
		String id = (String) session.getAttribute("sid");
 		ArrayList<ReviewVO> myreviewList = service2.myreviewList(id);
 		
 		model.addAttribute("list", myreviewList);
 		
// 		int total=service.getTotal(cri);
//		PageMakerVO pageMaker=new PageMakerVO(cri,total);
//		model.addAttribute("pageMaker", pageMaker);
		
 		return "/member/myreviewForm";
 	}

 	//아이디 찾기 폼으로 이동
 	@RequestMapping("/findid")
	public String findid() {
		return "/member/findidform";
	}
 	
 	//아이디 찾기 
 	@ResponseBody
	@RequestMapping("/serachid")
 	public ArrayList<MemberVO> serachid(@RequestParam HashMap<String, Object> param, 
			Model model){

		ArrayList<MemberVO> memList = service.serachid(param);
		model.addAttribute("memList", memList);

		return memList;
	}
 	
	// 비밀번호 찾기 폼으로 이동
	@RequestMapping("/findpw")
	public String findpw() {
		return "/member/findpwform";
	}
	
	//아이디 찾기 
	 	@ResponseBody
		@RequestMapping("/serachpw")
	 	public ArrayList<MemberVO> serachpw(@RequestParam HashMap<String, Object> param, 
				Model model){

			ArrayList<MemberVO> memList = service.serachpw(param);
			model.addAttribute("memList", memList);

			return memList;
		}
}
