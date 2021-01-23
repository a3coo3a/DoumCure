package com.team3.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team3.command.BoardVO;
import com.team3.command.UserVO;
import com.team3.common.util.Criteria;
import com.team3.common.util.PageVO;
import com.team3.user.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	UserService userService;
	
	// 화면구현
	@RequestMapping({"/join","/login","/id_pwJoin","/userUpdate","/navercallback"})
	public void views() {
	}
	
	// id- pw 로그인
	@RequestMapping("/loginForm")
	public String loginForm(UserVO vo, HttpSession session,
							RedirectAttributes RA) {
		
		int result = userService.login(vo);
		
		if(result == 1) {
			UserVO userVO = userService.getInfo(vo.getUserId());
			System.out.println(userVO.toString());
			session.setAttribute("userVO", userVO);
			return "redirect:../";
		}else {
			RA.addFlashAttribute("msg", "아이디와 비밀번호를 확인해 주세요");
			return "redirect:/user/login";
		}
	}
	
	// 카카오 로그인
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
		
		UserVO userVO = userService.getInfo(vo.getUserId());
		
		if(userVO == null) {
			int res = userService.join(vo);
			System.out.println(res);
			if(res == 1) {
				System.out.println("조인성공");
				userVO = userService.getInfo(userVO.getUserId());
				System.out.println("꺼내온 VO : "+userVO.toString());
				session.setAttribute("userVO", userVO);
			}
		}else if(userVO != null) {
			System.out.println("null아님");
			userVO = userService.getInfo(userVO.getUserId());
			System.out.println("null아님 Vo확인 : "+ userVO.toString());
			session.setAttribute("userVO", userVO);
		}
		
		
		//System.out.println(userVO);  // 없으면 null, null 은 toString이 안됨
		
		return "redirect:../";
	}

	
	// 아이디 중복체크
	@ResponseBody
	@RequestMapping("/idCheck")
	public int idCheck(@RequestBody UserVO vo) {
		int result = userService.idCheck(vo);
		return result;
	}

	// 가입 db등록
	@RequestMapping("/joinForm")
	public String join(UserVO vo, RedirectAttributes RA) {
		
		int result = userService.join(vo);
		
		
		if(result == 1) {//성공
			RA.addFlashAttribute("joinMsg",vo);
			return "redirect:/user/login";
		}else {
			RA.addFlashAttribute("joinMsg","가입에 실패 했습니다. 관리자에게 문의하세요");
			return "redirect:/user/id_pwJoin";
		}
		
		
	}
	
	//mypage 화면구현 및 내가 쓴 글
	@RequestMapping("/mypage")
	public String mypage(Model model, Criteria cri, HttpSession session) {
		
		//화면으로 넘어갈 때 글정보를 가지고 갈수 있도록 처리 getList()로 조회한 결과를 리스트화면에 출력.
		
		UserVO user = (UserVO)session.getAttribute("userVO");
		if(user != null) {
		ArrayList<BoardVO> list = userService.getMyBbsList(cri, user);
		int total = userService.getTotal(user);//전체 게시물 수 
		PageVO pageVO = new PageVO(cri, total);
			
		//화면에 전달할 값
		model.addAttribute("list", list);
		model.addAttribute("pageVO", pageVO);
		
		
		
		
		}else if(user == null) {
			model.addAttribute("errorMsg", "세션값이 없습니다.");
		}
		
		return "user/mypage";
	}

	
	// 회원 정보 업데이트
	@RequestMapping("/userUpdateForm")
	public String userUpdate(UserVO vo, RedirectAttributes RA,
							HttpSession session) {
		int result = userService.userUpdate(vo);
		
		if(result == 1) {
			UserVO userVO = userService.getInfo(vo.getUserId());
			session.setAttribute("userVO", userVO);
			RA.addFlashAttribute("updateMsg","회원정보가 수정되었습니다.");
		}else {
			RA.addFlashAttribute("updateMsg","정보 수정에 실패 하였습니다. 관리자에게 문의해주세요");
		}
			
		return "redirect:/user/userUpdate";
	}
	
	
	// 회원 탈퇴
	@RequestMapping("/deleteForm")
	public String deleteForm(@RequestParam("deletePw") String userPw, HttpSession session,
							RedirectAttributes RA) {
		UserVO vo = (UserVO)session.getAttribute("userVO");
		
		int result = userService.userDelete(vo.getUserId(),userPw);
		
		if(result == 1) {
			session.invalidate();
			RA.addFlashAttribute("deleteMsg", "탈퇴되었습니다. 다음에 또 만나요~!");
			return "redirect:../";
		}else {
			RA.addFlashAttribute("updateMsg", "탈퇴에 실패 했습니다. 관리자에게 문의하세요");
			return "redirect:/user/userUpdate";
		}
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("userVO");
		return "redirect:/";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}