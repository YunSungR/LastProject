package com.multi.lastproject.dao;

import java.util.ArrayList;
import java.util.HashMap;


import com.multi.lastproject.model.Criteria;
import com.multi.lastproject.model.MemberVO;



public interface IMemberDAO {
	
	void insertMember(MemberVO vo);
	MemberVO loginCheck(HashMap<String, Object> map);
	MemberVO memNameBring(String memName); 
	String memIdCheck(String memId);
	int accountDelete(MemberVO vo);
	void infoedit(MemberVO vo);
	MemberVO memberInfo(String memId);
}
