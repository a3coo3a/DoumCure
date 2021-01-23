package com.team3.controller;


import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.team3.command.MediVO;
import com.team3.command.UserVO;
import com.team3.common.util.Criteria;
import com.team3.common.util.PageVO;
import com.team3.medi.service.MediService;

@Controller
@RequestMapping("/medi")
public class MediController {

	 @Autowired
	 MediService mediService;

	@RequestMapping({ "/mediStore", "/mediSearch", "mediCompare2", "mediCompare3" })
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
		
		model.addAttribute("mediVO", mediVO);
	
		return "medi/mediDetail";
	}

	
	@RequestMapping("/addBookmark")
	public int addBookmark(@RequestParam("proNo") String proNo, HttpSession session) {
		System.out.println("addbook"+proNo);
		int res = -1;
		UserVO userVO = (UserVO)session.getAttribute("userVO");
		// 0 : 회원없음
		 // 1 : 이미 존재
		 // 2 : 추가
		 // 3 : 실패
		if(userVO != null) {
			if(userVO.getUserBookMark01().equals(proNo)) {
				res = 1;		
			}else if(userVO.getUserBookMark02().equals(proNo)) {
				res = 1;
			}else if(userVO.getUserBookMark03().equals(proNo)) {
				res = 1;
			}else {
				if(userVO.getUserBookMark01()==null) {
					// book1 추가
					res = mediService.addBookmark1(userVO.getUserId(), proNo);
					System.out.println("insert성공 : "+res);
				}else if(userVO.getUserBookMark02()==null) {
					// book2 추가
					res = mediService.addBookmark2(userVO.getUserId(), proNo);
					System.out.println("insert성공 : "+res);
				}else if(userVO.getUserBookMark03()==null) {
					// book3 추가
					res = mediService.addBookmark3(userVO.getUserId(), proNo);
					System.out.println("insert성공 : "+res);
				}
				
			}
		}else {
			res = 0;
		}
					
		return res;
	}
	
	
	
	
	
	
	
	
	
	
	
}
