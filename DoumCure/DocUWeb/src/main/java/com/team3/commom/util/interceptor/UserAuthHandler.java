package com.team3.commom.util.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.team3.command.UserVO;

public class UserAuthHandler extends HandlerInterceptorAdapter {
	//회원페이지 관련된 요청이 들어왔을 때, 요청을 가로채 처리할 인터셉터
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		//세션정보의 확인
		HttpSession session = request.getSession();
		UserVO userVO = (UserVO)session.getAttribute("userVO");
		
		if(userVO == null) { //로그인이 안된 시점
			response.sendRedirect(request.getContextPath() + "/user/login"); //로그인페이지로
			
			return false; //컨트롤러를 실행하지 않음
			
		}else { //로그인이 된 시점
			return true; //컨트롤러를 실행함
		}
		
		
	}

}
