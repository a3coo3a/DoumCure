package com.team3.medi.service;

import java.util.ArrayList;

import com.team3.command.MediVO;
import com.team3.common.util.Criteria;

public interface MediService {

	public ArrayList<MediVO> getList(Criteria cri, String mediSearchData);
	public int getTotal(String mediSearchData);
	public MediVO getInfo(String proNo);
	public int addBookmark1(String userId, String proNo);
	public int addBookmark2(String userId, String proNo);
	public int addBookmark3(String userId, String proNo);
	
}
