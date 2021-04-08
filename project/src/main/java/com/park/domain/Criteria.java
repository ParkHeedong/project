package com.park.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {
	
	private int pageNum;
	private int amount;
	
	private String type;
	private String keyword;
	
	public Criteria() {
		this(1,10);
	}

	public Criteria(int pageNum, int amount) {

		this.pageNum = pageNum;
		this.amount = amount;
	}
//Criteria 클래스를 하나 만들어 놓으면 편하게 하나의 타입만으로 파라미터나 리턴 타입을 사용할 수 있기 때문에 편하다.

	public String[]	getTypeArr() {
		
		return type == null? new String[] {}: type.split("");
	}
	
	//게시물 삭제 후에 페이지 번호나 검색 조건을 유지하면서 이동하기 위해서는 'redirect'에 필요한 파라미터들을 매번 추가해야 하는 불편함이 있는데 이를 처리하기위함.
	public String getListLink() {
		
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("pageNum", this.pageNum)
				.queryParam("amount", this.getAmount())
				.queryParam("type", this.getType())
				.queryParam("keyword", this.getKeyword());
		
		return builder.toUriString();
	}
}
