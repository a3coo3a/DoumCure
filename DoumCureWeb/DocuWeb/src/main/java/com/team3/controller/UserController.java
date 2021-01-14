package com.team3.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/user")
public class UserController {
	
	@RequestMapping("/join")
	public String join() {
		return "user/join";
	}
	
}
