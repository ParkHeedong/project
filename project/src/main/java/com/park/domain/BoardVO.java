package com.park.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class BoardVO {
	
	private Long bno;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	private Date updatedate;
	
	private int replyCnt; //댓글의 수
	
	private List<BoardAttachVO> attachList;

}

//클래스 레벨에서 @Data 어노테이션을 사용하면 모든 필드를 대상으로 접근자와 설정자가 자동으로 생성되고, final 또는 @NonNull 필드 값을 파라미터로 받는 생성자가 만들어지며
//toString, equals, hashCode 메소드가 자동으로 만들어진다.