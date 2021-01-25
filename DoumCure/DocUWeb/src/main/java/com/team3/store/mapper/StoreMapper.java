package com.team3.store.mapper;

import java.util.ArrayList;

import com.team3.command.StoreVO;

public interface StoreMapper {
	public ArrayList<String> getGu(String si);
	public ArrayList<String> getRo(StoreVO vo);
	public ArrayList<StoreVO> getList(StoreVO vo);
	public ArrayList<Double> getAvg(StoreVO vo);
	public Double avgX(StoreVO vo);
	public Double avgY(StoreVO vo);
	public ArrayList<StoreVO> searchKeyword(String key);
	public ArrayList<StoreVO> searchKeywordLoca(StoreVO vo);
}
