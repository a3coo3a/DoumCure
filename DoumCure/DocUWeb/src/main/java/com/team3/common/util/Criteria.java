package com.team3.common.util;

import lombok.Data;

// criteria : 기준
@Data
public class Criteria {
	// sql문에 전달할 값을 setter, getter로 갖는 기준클래스
	private int pageNum;  // 페이지 번호
	private int amount;  // 페이지 갯수

	// 검색에 필요한 데이터를 변수로 선언
	private String searchType;
	private String searchName;
	
	public Criteria() {
		this(1,8);
	}
	public Criteria(int pageNum, int amount) {
		super();
		this.pageNum = pageNum;
		this.amount = amount;
	}


}
