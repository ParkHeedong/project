package com.park.service;

import java.util.List;

import com.park.domain.BoardVO;
import com.park.domain.Criteria;

public interface BoardService {
	
	public void register(BoardVO board);
	
	public BoardVO get(Long bno); //특정한 게시물을 가져옴
	
	public boolean modify(BoardVO board);
	
	public boolean remove(Long bno);
	
	//public List<BoardVO> getList(); //전체 리스트를 가져옴

	public List<BoardVO> getList(Criteria cri); //Criteria를 파라미터로 처리하도록 수정
	
	public int getTotal(Criteria cri);
}
