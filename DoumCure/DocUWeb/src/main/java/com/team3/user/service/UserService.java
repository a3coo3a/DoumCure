package com.team3.user.service;

import java.util.ArrayList;

import com.team3.command.BoardVO;
import com.team3.command.UserVO;
import com.team3.common.util.Criteria;

public interface UserService {
	public int idCheck(UserVO vo);
	public int join(UserVO vo);
	public int login(UserVO vo);
	public UserVO getInfo(String userId);
	public int getTotal(UserVO vo);
	public ArrayList<BoardVO> getMyBbsList(Criteria cri,UserVO vo);
}
