package com.team3.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team3.command.UserVO;
import com.team3.user.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	UserService userService;
	
	@RequestMapping({"/join","/login","/id_pwJoin","/mypage","/userUpdate","/navercallback"})
	public void views() {
	}
	
	@RequestMapping("/loginForm")
	public String loginForm(UserVO vo, HttpSession session,
							RedirectAttributes RA) {
		
		System.out.println("loginForm:"+vo.toString());
		
		UserVO userVO = userService.userCheck(vo);
		
		if(userVO != null) {
			session.setAttribute("userVO", userVO);
			return "redirect:../";
		}else {
			RA.addFlashAttribute("msg", "아이디와 비밀번호를 확인해 주세요");
			return "redirect:/user/login";
		}
		
	}
	
	
	@RequestMapping("/kakaoLoginForm")
	public String kakaoLoginForm(@RequestParam("kakaoId") String kakaoId,
								 @RequestParam("kakaoPw") String kakaoPw,
								 @RequestParam("kakaoNickName") String kakaoNickName,
								 HttpSession session) {
		UserVO vo = new UserVO();
		vo.setUserId(kakaoId);
		vo.setUserPw(kakaoPw);
		vo.setUserNickName(kakaoNickName);
		
		
		System.out.println("kakaoForm:"+vo.toString());
		
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
	
	@RequestMapping("/naverForm")
	public String naverForm() {
		System.out.println("------------------네이버 도착----------------------");
		return "redirect:../";
	}
	
}
