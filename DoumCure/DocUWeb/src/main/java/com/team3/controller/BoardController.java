package com.team3.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team3.board.service.BoardService;
import com.team3.command.BoardVO;
import com.team3.common.util.Criteria;
import com.team3.common.util.PageVO;



@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	@Qualifier("boardService")
	private BoardService boardService;
	
	
	
	//QA 게시판 글 목록
	@RequestMapping("/QAboardList")
	public String qabbsList(Model model, Criteria cri) {
		
		//화면으로 넘어갈 때 글정보를 가지고 갈수 있도록 처리 getList()로 조회한 결과를 리스트화면에 출력.
		
		ArrayList<BoardVO> list = boardService.getbbsList(cri);
		System.out.println(list);
		int total = boardService.getTotal(cri);//전체 게시물 수 
		System.out.println(total);
		PageVO pageVO = new PageVO(cri, total);
			
		//화면에 전달할 값
		model.addAttribute("list", list);
		model.addAttribute("pageVO", pageVO);
		
		
		return "board/QAboardList";
	}
	
	
	//글 등록 화면
	@RequestMapping("/bbsRegist")
	public String regist() {
		
		return "board/bbsRegist";
	}
	
	
	
	//글 등록
	
	
	
	//글 상세 
	
	//글 변경화면
	
	
	//글 업뎃
	
	
	//글 삭제
	
	
	
	
}
