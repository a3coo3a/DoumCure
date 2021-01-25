package com.team3.controller;


import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team3.command.MediVO;
import com.team3.command.UserVO;
import com.team3.common.util.Criteria;
import com.team3.common.util.PageVO;
import com.team3.medi.service.MediService;
import com.team3.user.service.UserService;

@Controller
@RequestMapping("/medi")
public class MediController {

	 @Autowired
	 MediService mediService;
	 
	 @Autowired
	 UserService userService;

	@RequestMapping({ "/mediStore", "/mediSearch"})
	public void views() {
	}

	@RequestMapping("/mediList")
	public String mediList(@RequestParam("mediSearchData") String mediSearchData, Criteria cri, Model model) {
		//System.out.println("mediSearchData:"+mediSearchData);
		ArrayList<MediVO> list = mediService.getList(cri, mediSearchData);
		int total = mediService.getTotal(mediSearchData);
		//System.out.println("total:"+total);
		PageVO pageVO = new PageVO(cri, total);
		
		model.addAttribute("mediSearchData", mediSearchData);
		model.addAttribute("pageVO", pageVO);
		model.addAttribute("list", list);
		
		return "medi/mediList";
	}

	@RequestMapping("/mediDetail")
	public String mediDetail(@RequestParam("proNo") String proNo, Model model) {
		System.out.println("mediDetail:"+proNo);
		
		MediVO mediVO = mediService.getInfo(proNo);
		
		mediVO.setProImg(mediService.getImg(mediVO.getProNo()));
		
		model.addAttribute("mediVO", mediVO);
	
		return "medi/mediDetail";
	}

	@ResponseBody
	@RequestMapping("/addBookmark")
	public int addBookmark(@RequestParam("proNo") String proNo, HttpSession session) {
		System.out.println("add:"+proNo);
		UserVO userVO = (UserVO)session.getAttribute("userVO");
		System.out.println("add:"+userVO.getUserId());				
		System.out.println("add:"+userVO.getUserBookMark01());		
		System.out.println("add:"+userVO.getUserBookMark02());		
		System.out.println("add:"+userVO.getUserBookMark03());	
		
		if(userVO.getUserBookMark01().equals(proNo)) return 2;  // 이미 존재
		if(userVO.getUserBookMark02().equals(proNo)) return 2;
		if(userVO.getUserBookMark03().equals(proNo)) return 2;
		
		int result = 0;  // 0이면 실패 , 1이면 성공
		
		if(userVO.getUserBookMark01().equals("0")) {
			userVO.setUserBookMark01(proNo);
			result = userService.userBmUpdate(userVO); 
		}else if(userVO.getUserBookMark02().equals("0")) {
			userVO.setUserBookMark02(proNo);
			result = userService.userBmUpdate(userVO);
		}else if(userVO.getUserBookMark03().equals("0")) {
			userVO.setUserBookMark03(proNo);
			result = userService.userBmUpdate(userVO);
		}else {
			// 3곳이 모두 가득 차있어서 
			result = 3;
		}
		if(result == 1) {
			UserVO vo = userService.getInfo(userVO.getUserId());
			System.out.println("추가후:"+vo.toString());
			session.setAttribute("userVO", vo);
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/rmBookmark")
	public int rmBookmark(@RequestParam("proNo") String proNo, HttpSession session) {
		System.out.println("remove :"+proNo);
		UserVO userVO = (UserVO)session.getAttribute("userVO");
		System.out.println("remove :"+userVO.getUserId());				
		System.out.println("remove1 :"+userVO.getUserBookMark01());		
		System.out.println("remove2 :"+userVO.getUserBookMark02());		
		System.out.println("remove3 :"+userVO.getUserBookMark03());	
		
		int result = 0;
		
		if(userVO.getUserBookMark01().equals(proNo)) {
			System.out.println("1");
			userVO.setUserBookMark01("0");
			result = userService.userBmUpdate(userVO);
			
		}else if(userVO.getUserBookMark02().equals(proNo)) {
			System.out.println("2");
			userVO.setUserBookMark02("0");
			result = userService.userBmUpdate(userVO);
			
		}else if(userVO.getUserBookMark03().equals(proNo)) {
			System.out.println("3");
			userVO.setUserBookMark03("0");
			result = userService.userBmUpdate(userVO);
		}else {
			result = 3;
		}
		System.out.println(result);
		
		if(result == 1) {
			UserVO vo = userService.getInfo(userVO.getUserId());
			System.out.println("제거후:"+vo.toString());
			session.setAttribute("userVO", vo);
		}
		
		return result;
	}
	
	@RequestMapping("/mediCompare2")
	public String mediCompare2(@RequestParam("proNos") String proNos, Model model) {
		String proNo1 = proNos.split("-")[0];
		String proNo2 = proNos.split("-")[1];
		
		MediVO vo1 = mediService.getInfo(proNo1);
		MediVO vo2 = mediService.getInfo(proNo2);

		vo1.setProImg(mediService.getImg(vo1.getProNo()));
		vo2.setProImg(mediService.getImg(vo2.getProNo()));
		
		model.addAttribute("vo1", vo1);
		model.addAttribute("vo2", vo2);
		
		return "medi/mediCompare2";
	}
	
	@RequestMapping("/mediCompare3")
	public String mediCompare3(@RequestParam("proNos") String proNos, Model model) {
		String proNo1 = proNos.split("-")[0];
		String proNo2 = proNos.split("-")[1];
		String proNo3 = proNos.split("-")[2];
		
		MediVO vo1 = mediService.getInfo(proNo1);
		MediVO vo2 = mediService.getInfo(proNo2);
		MediVO vo3 = mediService.getInfo(proNo3);

		vo1.setProImg(mediService.getImg(vo1.getProNo()));
		vo2.setProImg(mediService.getImg(vo2.getProNo()));
		vo3.setProImg(mediService.getImg(vo3.getProNo()));
		
		model.addAttribute("vo1", vo1);
		model.addAttribute("vo2", vo2);
		model.addAttribute("vo3", vo3);
		
		return "medi/mediCompare3";
	}
	
	
	
	
	
}
