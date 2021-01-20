package com.team3.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	
	
	
	//자유게시판 글 목록
	@RequestMapping("/freeboardList")
	public String freeList(Model model, Criteria cri) {
		
		//화면으로 넘어갈 때 글정보를 가지고 갈수 있도록 처리 getList()로 조회한 결과를 리스트화면에 출력.
		
		ArrayList<BoardVO> list = boardService.getfreeList(cri);
		System.out.println(list);
		int total = boardService.getTotal(cri);//전체 게시물 수 
		System.out.println(total);
		PageVO pageVO = new PageVO(cri, total);
			
		//화면에 전달할 값
		model.addAttribute("list", list);
		model.addAttribute("pageVO", pageVO);
		
		
		return "board/freeboardList";
	}
	
	
	//글 등록 화면
	@RequestMapping("/freeboardRegist")
	public String freeboardRegist() {
		
		return "board/freeboardRegist";
	}
	
	
	
	//글 등록
	@RequestMapping(value = "/registForm", method = RequestMethod.POST)
	public String registForm(BoardVO vo, RedirectAttributes RA) {
		
		boardService.freeRegist(vo); //insert실행
		RA.addFlashAttribute("msg", "정상적으로 등록처리 되었습니다"); //메시지를 리스트 화면으로 전달

		return "redirect:/board/freeboardList";
	}

	
	
	//글 상세 
	
	//글 변경화면
	
	
	//글 업뎃
	
	
	//글 삭제
	
	
	
	
}
