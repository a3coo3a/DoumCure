package com.team3.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/")
public class MainController {
	
	//화면처리
	@RequestMapping("/")
	public String home() {
		return "home";
	}
	
	@RequestMapping("/popup")
	public String popup() {
		return "popup";
	}

}
