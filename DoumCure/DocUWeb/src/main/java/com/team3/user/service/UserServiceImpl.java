package com.team3.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team3.command.UserVO;
import com.team3.user.mapper.UserMapper;

@Service("userService")
public class UserServiceImpl implements UserService{

	@Autowired
	UserMapper userMapper;
	
	public UserVO dbDefault(UserVO vo) {
		UserVO voSetting = vo;
		if(vo.getUserNickName() == null) vo.setUserNickName("닉네임");
		if(vo.getUserPhoneNum() == null) vo.setUserPhoneNum("010-0000-0000");
		if(vo.getUserAddrZipNum() == null) vo.setUserAddrZipNum("00000");
		if(vo.getUserAddrBasic() == null) vo.setUserAddrBasic("기본주소");
		if(vo.getUserAddrDetailL() == null) vo.setUserAddrDetailL("상세주소");
		if(vo.getUserBookMark01() == null) vo.setUserBookMark01("0");
		if(vo.getUserBookMark02() == null) vo.setUserBookMark02("0");
		if(vo.getUserBookMark03() == null) vo.setUserBookMark03("0");
		if(vo.getUserManage() == null) vo.setUserManage("U");
		return voSetting;
	}
	
	@Override
	public int idCheck(UserVO vo) {
		return userMapper.idCheck(vo);
	}
	@Override
	public UserVO userCheck(UserVO vo) {
		return userMapper.userCheck(vo);
	}
	@Override
	public int join(UserVO vo) {
		UserVO voUpdate = dbDefault(vo);
		return userMapper.join(voUpdate);
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
