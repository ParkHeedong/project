package com.park.service;

import java.util.List;

import com.park.domain.BoardVO;

public interface BoardService {
	
	public void register(BoardVO board);
	
	public BoardVO get(Long bno); //특정한 게시물을 가져옴
	
	public boolean modify(BoardVO board);
	
	public boolean remove(Long bno);
	
	public List<BoardVO> getList(); //전체 리스트를 가져옴

}
