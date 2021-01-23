package com.team3.store.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public ArrayList<String> getRo(String gu) {
		return storeMapper.getRo(gu);
	}

	
}
