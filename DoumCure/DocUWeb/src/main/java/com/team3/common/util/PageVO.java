package com.team3.common.util;

import lombok.Data;

@Data
public class PageVO {
	//화면에 페이지네이션을 그리는 클래스
	private int startPage;  //페이지 네이션 시작번호
	private int endPage;	//페이지 네이션 끝번호
	private boolean prev;	//이전버튼활성화여부
	private boolean next;	//다음버튼활성화여부
	
	private int pageNum;  	//조회페이지번호
	private int amount;		//데이터개수
	private int total;  	//전체 게시글 수
	private Criteria cri;	 // 페이지 기준(번호, 데이터개수)
	
	//PageVO가 생성될때 cri, total 반드시 전달되어야하기 때문에 한개로 제한
	public PageVO(Criteria cri, int total) {
		//페이지번호, 데이터 개수, 전체게시글 수는 전달되는 값에 따라서 초기화
		this.pageNum = cri.getPageNum();
		this.amount = cri.getAmount();
		this.total = total;
		this.cri = cri;
		
		//끝페이지계산
		// 사용자가 pageNum를 11번 or 13번 눌렀다 -> endPage = 20 이 되도록
		// ceil() : 올림 >> double 타입이어야 0.5588일때 올림해서 1이 나옴. 안그럼 걍 0
		this.endPage = (int) Math.ceil(this.pageNum/10.0) * 10;
		
		//끝페이지를 이용해서 처음페이지 계산
		// endPage = 20 -> startPage = 11, endPage = 30 -> startPage = 21
		this.startPage = endPage - 10 + 1 ;
		
		//진짜 끝번호 계산
		// 10개씩 보일때 amount
		// 데이터가 60개 있다고 가정하면, pageNum 5번 누를때 끝페이지 10인데 실제로 6번이 나오게
		// 데이터가 112개 있다고 가정하면, pageNum 11번 누를때 끝페이지 번호 12번이 나오게
		// 20개씩 보일때 amount
		// 데이터 60개 -> pageNum 2번 누르면 realEnd = 3
		//특정조건에서 endPage를 변경
		int realEnd = (int) Math.ceil( this.total/(double)this.amount);
		if(this.endPage > realEnd) {
			this.endPage = realEnd;
		}
		
		//이전버튼 활성화 여부
		//startPage 1,11,21,31이기 때문에 1초과 이면 활성화
		this.prev = this.startPage > 1;
		
		//다음버튼 활성화 여부
		// 조건 - 진짜끝번호가 페이지 끝번호보다 큰경우 활성화
		this.next = realEnd > this.endPage;
		
	}
	
	//getter, setter
}
