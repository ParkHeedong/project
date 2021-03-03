package com.park.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.park.domain.BoardVO;
import com.park.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {
	
	private BoardMapper mapper;
	
	@Override
	public void register(BoardVO board) {
		
		log.info("register..........." + board);
		
		mapper.insertSelectKey(board);
	}
	
	@Override
	public List<BoardVO> getList() {
		
		log.info("getList...........");
		
		return mapper.getList();
	}

	@Override
	public BoardVO get(Long bno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean modify(BoardVO board) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean remove(Long bno) {
		// TODO Auto-generated method stub
		return false;
	}


}
