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
//	@Override
//	public boolean freeRegist(BoardVO vo) {
//		
//		return boardMapper.bbsRegist(vo);
//	}

	//글 목록 조회 
	@Override
	public ArrayList<BoardVO> getfreeList(Criteria cri) {
		
		return boardMapper.getfreeList(cri);
	}

	//글 총 겟수
	@Override
	public int getTotal(Criteria cri) {
	
		return boardMapper.getTotal(cri);
	}

	//등록
	@Override
	public void insertFile(BoardVO vo) {
		
		boardMapper.insertFile(vo);
	}

	//상세
	@Override
	public BoardVO getfreeContent(int bbsNo) {
		
		return boardMapper.getfreeContent(bbsNo);
	}

	@Override
	public int freeupdate(BoardVO vo) {
		System.out.println("여기는 서비스 입니다 " +  vo.toString());
		return boardMapper.freeupdate(vo);
	}

	@Override
	public int freeupdate2(BoardVO vo) {
		
		return boardMapper.freeupdate2(vo);
	}
	
	
	@Override
	public int freeDelete(int bbsno) {
	
		return boardMapper.freeDelete(bbsno);
	}


	//==================공지게시판=================================

	@Override
	public ArrayList<BoardVO> getnotiList(Criteria cri) {
	
		return boardMapper.getnotiList(cri);
	}
	
	//글 등록
	@Override
	public void insertFile2(BoardVO vo) {
			System.out.println("글등록 서비스");
		boardMapper.insertFile2(vo);
	}


//	//글 전체 수정
//	@Override
//	public int bbsupdate(BoardVO vo) {
//		return boardMapper.freeupdate(vo);
//	}
//
//	//글 부분 수정
//	@Override
//	public int bbsupdate2(BoardVO vo) {
//		
//		return  boardMapper.freeupdate(vo);
//	}
//
//	@Override
//	public int bbsDelete(int bbsno) {
//		
//		return boardMapper.bbsDelete(bbsno);
//	}

	

	

}
