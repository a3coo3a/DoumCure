package com.team3.board.mapper;

import java.util.ArrayList;

import com.team3.command.BoardVO;
import com.team3.common.util.Criteria;

public interface BoardMapper {
	
	public void bbsRegist(BoardVO vo);//글 등록
	public ArrayList<BoardVO> getbbsList(Criteria cri); //글 목록 조회
	public int getTotal(Criteria cri);//전체게시글
	
	
}
