package com.team3.user.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team3.command.BoardVO;
import com.team3.command.UserVO;
import com.team3.common.util.Criteria;
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
		if(vo.getUserAddrDetail() == null) vo.setUserAddrDetail("상세주소");
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
	public int join(UserVO vo) {
		UserVO voUpdate = dbDefault(vo);
		return userMapper.join(voUpdate);
	}

	@Override
	public int login(UserVO vo) {
		return userMapper.login(vo);
	}

	@Override
	public UserVO getInfo(String userId) {
		return userMapper.getInfo(userId);
	}

	@Override
	public int getTotal(UserVO vo) {
		return userMapper.getTotal(vo);
	}

	@Override
	public ArrayList<BoardVO> getMyBbsList(Criteria cri, UserVO vo) {
		String userId = vo.getUserId();
		return userMapper.getMyBbsList(cri, userId);
	}

	@Override
	public int userUpdate(UserVO vo) {
		UserVO voUpdate = dbDefault(vo);
		return userMapper.userUpdate(voUpdate);
	}

	@Override
	public int userDelete(String userId, String userPw) {
		return userMapper.userDelete(userId, userPw);
	}

	

}
