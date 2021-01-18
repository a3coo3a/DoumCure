package com.team3.board.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team3.command.BoardVO;
import com.team3.common.util.Criteria;
import com.team3.board.mapper.BoardMapper;



@Service("boardService")
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardMapper boardMapper;
	
	//글 등록
	@Override
	public void bbsRegist(BoardVO vo) {
		
		boardMapper.bbsRegist(vo);
	}

	//글 목록 조회 
	@Override
	public ArrayList<BoardVO> getbbsList(Criteria cri) {
		
		return boardMapper.getbbsList(cri);
	}

	//글 총 겟수
	@Override
	public int getTotal(Criteria cri) {
	
		return boardMapper.getTotal(cri);
	}

}