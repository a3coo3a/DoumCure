package com.team3.command;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class StoreVO {
	private String storeName; 	// 약국명 -- varchar2(100) not null
	private String si;			// 시 -- varchar2(100) not null
	private String gu;			// 구 -- varchar2(100) not null
	private String ro;			// 로 -- varchar2(100) not null
	private String zipCode;		// 우편번호 -- varchar2(50) 
	private String addr;		// 주소 -- varchar2(300) not null
	private String tel;			// 전화번호 -- varchar2(50)
	private String xCode;		// x좌표-- varchar2(50) not null
	private String yCode;		// y좌표 -- varchar2(50) not null
	
	private String keyword; 	//검색을 위한 변수 --- DB에 없음

}
