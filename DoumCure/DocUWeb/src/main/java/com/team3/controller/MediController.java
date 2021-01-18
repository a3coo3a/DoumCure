package com.team3.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team3.medi.service.MediService;


@Controller
@RequestMapping("/medi")
public class MediController {

	@Autowired
	MediService mediService;
	
	@RequestMapping("/mediList")
	public String mediList() {
		return "medi/mediList";
	}
	
	@RequestMapping("/mediStore")
	public String mediStore() {
		return "medi/mediStore"; 
	}
	
	@RequestMapping("/mediSearch")
	public String mediSearch() {
		return "medi/mediSearch"; 
	}
	
}
