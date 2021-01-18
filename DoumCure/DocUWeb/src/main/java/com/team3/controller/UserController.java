package com.team3.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team3.command.UserVO;
import com.team3.user.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	UserService userService;
	
	@RequestMapping({"/join","/login","/id_pwJoin","/mypage","userUpdate"})
	public void views() {
	}
	
	
	@RequestMapping("/loginForm")
	public String loginForm(UserVO vo,							
							HttpSession session) {
		
		System.out.println("1."+vo.toString());
		
		UserVO userVO = userService.userCheck(vo);
		
		if(userVO == null) {
			int res = userService.join(vo);
			System.out.println(res);
		}else if(userVO != null) {
			session.setAttribute("userVO", userVO);
		}
		
		
		//System.out.println(userVO);  // 없으면 null, null 은 toString이 안됨
		
		return "redirect:../";
	}
	
	
}
