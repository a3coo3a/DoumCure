package com.team3.command;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserVO {
	
	private String userId;			// varchar2(50) primary key
	private String userPw;			// varchar2(100) not null
	private String userPhoneNum;	// varchar2(50) default 010-0000-0000,   
	private String userAddrZipNum;	// varchar2(50) default '00000',
	private String userAddrBasic;	// varchar2(300) default '기본주소',
	private String userAddrDetailL;	// varchar2(300) default '상세주소',
	private String userBookMark01;	// varchar2(20),   -- 즐겨찾기 (prono FK)
	private String userBookMark02;	// varchar2(20),   -- 즐겨찾기 (prono FK)
	private String userBookMark03;	// varchar2(20),   -- 즐겨찾기 (prono FK)
	private String userManage;		// varchar2(20) check (USERMANAGE in('M','U')) default 'U'  -- 권한
}
