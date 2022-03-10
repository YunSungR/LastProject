package com.multi.lastproject.dao;

import java.util.ArrayList;

import com.multi.lastproject.model.FoodProductVO;
import com.multi.lastproject.model.PrdCriteria;

public interface IProductDAO {
	
	public ArrayList<FoodProductVO> list(PrdCriteria cri);
	public ArrayList<FoodProductVO> fplist(PrdCriteria cri);
	public int getTotal();
	public FoodProductVO getPage(String fdPrdNo);
	public int getTotalBoard(String ctgId);
	public ArrayList<FoodProductVO> selectProudct(String prdName);
}
