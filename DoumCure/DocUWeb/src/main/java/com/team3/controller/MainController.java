package com.team3.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team3.visit.service.VisitService;


@Controller
@RequestMapping("/")
public class MainController {

	//방문자
	@Autowired
	@Qualifier("VisitService")
	private VisitService visitService;
	
	//화면처리
	@RequestMapping("/popup")
	public String popup() {
		return "popup";
	}
	
	
	
	//방문자 추가
	@RequestMapping("/home")
	public String VisitTotalCount(Model model) {
		visitService.setVisitTotalCount();
		
		int day = visitService.getDayCount();
		int total = visitService.getTotalCount();

		model.addAttribute("day", day);
		model.addAttribute("total", total);
		
		return "home";
		
	}
	
	
}
