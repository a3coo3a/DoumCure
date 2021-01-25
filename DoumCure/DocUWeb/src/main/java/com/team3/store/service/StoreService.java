package com.team3.store.service;

import java.util.ArrayList;

import com.team3.command.StoreVO;

public interface StoreService {

	public ArrayList<String> getGu(String si);
	public ArrayList<String> getRo(StoreVO vo);
	public ArrayList<StoreVO> getList(StoreVO vo);
	public Double avgX(StoreVO vo);
	public Double avgY(StoreVO vo);
	public ArrayList<StoreVO> searchKeyword(String key);
	public ArrayList<StoreVO> searchKeywordLoca(StoreVO vo);

}
