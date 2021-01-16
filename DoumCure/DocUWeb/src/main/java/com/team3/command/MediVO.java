package com.team3.command;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MediVO {
	
	private String proNo; 		//varchar2(20) primary key,
	private String proName; 	//varchar2(50) not null,
	private String proCom; 		//varchar2(200) not null,
	private String proEffi; 	//varchar2(200) default '내용없음',
	private String proSave; 	//varchar2(1000) default '내용없음',
	private String proDate; 	//varchar2(200) default '내용없음',
	private String proUse; 		//varchar2(1000) default '내용없음',
	private String proMain; 	//varchar2(2000) default '내용없음',
	private String proSub; 		//varchar2(2000) default '내용없음',
	private String proDanger;	//varchar2(2000) default '내용없음',
	private String proImg;		//varchar2(1000)
}
