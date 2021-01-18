package com.team3.user.mapper;

import com.team3.command.UserVO;

public interface UserMapper {
	public int idCheck(UserVO vo);
	public UserVO userCheck(UserVO vo);
	public int join(UserVO vo);
	public UserVO login(UserVO vo);
	public UserVO getInfo(String userId);
}
