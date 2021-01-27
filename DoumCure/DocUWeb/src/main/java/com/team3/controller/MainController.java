package com.team3.controller;

import java.io.File;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team3.board.service.BoardService;
import com.team3.command.BoardVO;
import com.team3.visit.service.VisitService;


@Controller
@RequestMapping("/")
public class MainController {

	//방문자
	@Autowired
	@Qualifier("VisitService")
	private VisitService visitService;
	
	//보드
	@Autowired
	@Qualifier("boardService")
	private BoardService boardService;
	
	//화면처리
	@RequestMapping("/popup")
	public String popup() {
		return "popup";
	}
	
	
	
	//방문자 추가
	@RequestMapping("/home")
	public String VisitTotalCount(Model model, BoardVO vo) {
		visitService.setVisitTotalCount();
		
		int day = visitService.getDayCount(); //오늘 방문자 수
		int total = visitService.getTotalCount(); //총 방문자 수
		ArrayList<BoardVO> bbs = boardService.getHome(vo);
		
		model.addAttribute("day", day);
		model.addAttribute("total", total);
		model.addAttribute("bbslist", bbs);
		
		return "home";
		
	}
	
	
}