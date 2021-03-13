package com.park.domain;

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
}
