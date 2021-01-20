package com.team3.controller;

import java.io.IOException;
import java.util.concurrent.ExecutionException;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team3.command.UserVO;
import com.team3.docuweb.auth.NaverLogin;
import com.team3.docuweb.auth.NaverValue;
import com.team3.user.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	UserService userService;
	
	
	// 서블릿에 id값에 맞추어 가지고 옴.
	@Inject
	private NaverValue naverSns;
	
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
	public String naverForm(Model model) throws Exception {
		System.out.println("------------------네이버 도착----------------------");
		
		
		
		NaverLogin naverLogin = new NaverLogin(naverSns);
		System.out.println(naverLogin.getNaverAuthURL());
		model.addAttribute("naver_url", naverLogin.getNaverAuthURL());
		
		
		
		
		return "redirect:../";
	}
	
	@RequestMapping("/auth/naver/callback")
	public String NaverLoginCallback(Model model, @RequestParam String code) throws IOException, InterruptedException, ExecutionException {
		// 1. code를 이용해서 access_token받기
		NaverLogin naverLogin = new NaverLogin(naverSns);
		// 2. access_token을 이용해서 사용자 profile 정보 가져오기
		String profile = naverLogin.getUserProfile(code);
		System.out.println("profile>>"+ profile);
		model.addAttribute("result", profile);
		// 3. DB에 해당 유저가 존재하는지를 체크
		
		// 4. 존재하면 로그인, 미존재시 DB저장 후 로그인
		return "/loginResult";
	}
	
	@ResponseBody
	@RequestMapping("/idCheck")
	public int idCheck(@RequestBody UserVO vo) {
		int result = userService.idCheck(vo);
		return result;
	}

	@RequestMapping("/joinForm")
	public String join(UserVO vo, RedirectAttributes RA) {
		
		System.out.println(vo.toString());
		
		int result = userService.join(vo);
		
		System.out.println(result);
		
		if(result == 1) {//성공
			RA.addFlashAttribute("joinMsg",vo.getUserId());
			return "redirect:/user/login";
		}else {
			RA.addFlashAttribute("joinMsg","가입에 실패 했습니다. 관리자에게 문의하세요");
			return "redirect:/user/id_pwJoin";
		}
		
		
	}
}