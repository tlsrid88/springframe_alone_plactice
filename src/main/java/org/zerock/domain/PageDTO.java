package org.zerock.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageDTO {

	private int startPage; // 시작 페이지 
	private int endPage; // 페이지 넘어의 끝
	private boolean prev, next; // 이전 페이지 , 다음 페이지 
	
	private int total; // 총 데이터의 개수
	private Criteria cri; // 표현되는 데이터의 개수 , 
	
	public PageDTO(Criteria cri, int total) {
		
		this.cri = cri;
		this.total = total;

		this.endPage = (int)(Math.ceil(cri.getPageNum() / 10.0)) * 10; // 현재 페이지 넘버의 끝 번호를 구하는 것 
		this.startPage = this.endPage - 9; // 현제 페이즈 넘버의 첫번쨰 명시될 페이지를 구하는 것 
		
		int realEnd = (int)(Math.ceil(total * 1.0) / cri.getAmount()); // 현재 존재하는 데이터의 진짜 끝 번호를 말하는 것 
		
		if (realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}
	
}
