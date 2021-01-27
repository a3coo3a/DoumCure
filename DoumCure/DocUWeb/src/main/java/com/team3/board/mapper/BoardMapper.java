package com.team3.board.mapper;

import java.util.ArrayList;

import com.team3.command.BoardVO;
import com.team3.common.util.Criteria;

public interface BoardMapper {
	
	
//	================자유게시판=========================
	public ArrayList<BoardVO> getfreeList(Criteria cri); //글 목록 조회
	public int getTotal(Criteria cri);//전체게시글
	public void insertFile(BoardVO vo); //게시물등록
	public BoardVO getfreeContent(int bbsNo); //상세
	public int freeupdate(BoardVO vo); // 전체 게시글 수정
	public int freeupdate2(BoardVO vo);	//글 수정 
	public int freeDelete(int bbsno); //삭제
	
	//==============공지게시판===================
	public ArrayList<BoardVO> getnotiList(Criteria cri);
	public int getTotal2(Criteria cri);//전체게시글
	public void insertFile2(BoardVO vo); //건강게시물 등록
	public int bbsupdate(BoardVO vo); // 전체 게시글 수정
	public int bbsupdate2(BoardVO vo);	//글 수정 
	public int bbsDelete(int bbsno); //삭제
	
	
	//홈화면 전송
	public ArrayList<BoardVO> getHome(BoardVO vo);
	
}
