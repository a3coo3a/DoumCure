package com.team3.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team3.user.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	UserService userService;
	
	@RequestMapping("/join")
	public String join() {
		return "user/join";
	}
	
	@RequestMapping("/login")
	public String login() {
		return "user/login";
	}
	
}
