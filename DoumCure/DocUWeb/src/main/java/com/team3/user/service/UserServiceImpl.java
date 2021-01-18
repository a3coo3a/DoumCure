package com.team3.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team3.command.UserVO;
import com.team3.user.mapper.UserMapper;

@Service("userService")
public class UserServiceImpl implements UserService{

	@Autowired
	UserMapper userMapper;
	
	@Override
	public int idCheck(UserVO vo) {
		return userMapper.idCheck(vo);
	}

	@Override
	public int join(UserVO vo) {
		return userMapper.join(vo);
	}

	@Override
	public UserVO login(UserVO vo) {
		return userMapper.login(vo);
	}

	@Override
	public UserVO getInfo(String userId) {
		return userMapper.getInfo(userId);
	}

}
