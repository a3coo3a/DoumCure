package com.team3.medi.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.team3.command.MediVO;
import com.team3.common.util.Criteria;

public interface MediMapper {

	public ArrayList<MediVO> getList(@Param("cri") Criteria cri,@Param("mediSearchData") String mediSearchData);
	public int getTotal(String mediSearchData);
	public MediVO getInfo(String proNo);
	
	
	
}
