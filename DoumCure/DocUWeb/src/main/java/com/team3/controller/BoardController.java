package com.team3.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team3.board.service.BoardService;



@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	BoardService boardService;
	
	@RequestMapping("/bbsList")
	public String bbsList() {
		return "board/bbsList";
	}
	
}
