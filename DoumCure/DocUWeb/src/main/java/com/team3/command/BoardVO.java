package com.team3.command;

import java.sql.Timestamp;



import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoardVO {
	private int bbsNo; //NUMBER(10), --글번호 FK 
    private String bbsWrite; //varchar2(50) primary key, --글쓴이 PK
    private String bbsTitle; //varchar2(200) not null , -- 제목
    private String bbsContent; //varchar2(2000) not null , -- 내용 
    private String uploadPath; //VARCHAR2(50) not null, -- 파일 경로
    private String fileLoca; //VARCHAR2(50) not null , -- 이미지 정보
    private String fileName; //VARCHAR2(50)  not null , -- 파일명
    private String fileRealName; //VARCHAR2(50) not null, -- 실제 파일면
    private String bbsOC; //varchar2(10) ('ON','OFF'), -- 비밀글체크 
    private String bbsCate; //varchar2(50), --카테고리
    private Timestamp bbsRegdate; //date default sysdate -- 등록일 
}
