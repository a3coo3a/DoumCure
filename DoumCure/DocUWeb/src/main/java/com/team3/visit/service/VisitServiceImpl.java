package com.team3.visit.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team3.visit.mapper.VisitMapper;

@Service("VisitService")
public class VisitServiceImpl implements VisitService{
	
	@Autowired
	private VisitMapper visitMapper;

	@Override
	public void setVisitTotalCount() {
		visitMapper.setVisitTotalCount();
	}

	@Override
	public int getTotalCount() {
		
		return visitMapper.getTotalCount();
	}

	@Override
	public int getDayCount() {
		
		return visitMapper.getDayCount();
	}

}
