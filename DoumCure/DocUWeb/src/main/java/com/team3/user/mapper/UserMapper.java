package com.team3.user.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.team3.command.BoardVO;
import com.team3.command.UserVO;
import com.team3.common.util.Criteria;

public interface UserMapper {
	public int idCheck(UserVO vo);
	public int join(UserVO vo);
	public int login(UserVO vo);
	public UserVO getInfo(String userId);
	public int getTotal(UserVO vo);
	public ArrayList<BoardVO> getMyBbsList(@Param("cri") Criteria cri,@Param("userId") String userId);
}
