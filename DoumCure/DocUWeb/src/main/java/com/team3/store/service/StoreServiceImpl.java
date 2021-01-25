package com.team3.store.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team3.command.StoreVO;
import com.team3.store.mapper.StoreMapper;

@Service("StoreService")
public class StoreServiceImpl implements StoreService {
	
	@Autowired
	private StoreMapper storeMapper;


	@Override
	public ArrayList<String> getGu(String si) {
		return storeMapper.getGu(si);
	}

	@Override
	public ArrayList<String> getRo(StoreVO vo) {
		return storeMapper.getRo(vo);
	}

	@Override
	public ArrayList<StoreVO> getList(StoreVO vo) {
		return storeMapper.getList(vo);
	}

	@Override
	public Double avgX(StoreVO vo) {
		return storeMapper.avgX(vo);
	}

	@Override
	public Double avgY(StoreVO vo) {
		return storeMapper.avgY(vo);
	}

	@Override
	public ArrayList<StoreVO> searchKeyword(String key) {
		return storeMapper.searchKeyword(key);
	}

	@Override
	public ArrayList<StoreVO> searchKeywordLoca(StoreVO vo) {
		return storeMapper.searchKeywordLoca(vo);
	}
 
	
}
