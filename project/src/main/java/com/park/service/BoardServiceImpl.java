package com.park.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.park.domain.BoardAttachVO;
import com.park.domain.BoardVO;
import com.park.domain.Criteria;
import com.park.mapper.BoardAttachMapper;
import com.park.mapper.BoardMapper;

import org.springframework.beans.factory.annotation.Autowired;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class BoardServiceImpl implements BoardService {
	
	//BoardMapper, BoardAttachMapper 주입
	@Setter(onMethod_= @Autowired)
	private BoardMapper mapper;
	
	@Setter(onMethod_= @Autowired)
	private BoardAttachMapper attachMapper;
	
	@Transactional
	@Override
	public void register(BoardVO board) {
		
		log.info("register..........." + board);
		
		mapper.insertSelectKey(board);
		
		if(board.getAttachList() == null || board.getAttachList().size() <= 0) {
			return;
		}
		
		board.getAttachList().forEach(attach -> {
			
			attach.setBno(board.getBno());
			attachMapper.insert(attach);
		});
	}
	
	//@Override
	//public List<BoardVO> getList() {
		
	//	log.info("getList...........");
		
	//	return mapper.getList();
	//}
	
	@Override
	public List<BoardVO> getList(Criteria cri){
		
		log.info("get List with criteria : " + cri);
		
		return mapper.getListPaging(cri);
	}

	@Override
	public BoardVO get(Long bno) {

		log.info("get..........." + bno);
		
		return mapper.read(bno);
		
	}

	//기존의 첨부파일 관련 데이터를 삭제한 후 다시 첨부파일 데이터를 추가하는 방식으로 수정
	@Override
	public boolean modify(BoardVO board) {

		log.info("modify.........." + board);
		
		attachMapper.deleteAll(board.getBno());
		
		boolean modifyResult = mapper.update(board) == 1;
		
		if(modifyResult && board.getAttachList() != null && board.getAttachList().size() > 0) {
			
			board.getAttachList().forEach(attach -> {
				
				attach.setBno(board.getBno());
				attachMapper.insert(attach);
			});
		}
		
		return modifyResult;
		//return mapper.update(board) == 1; //정상적으로 수정,삭제가 이루어지면 1이라는 값이 반환되기 때문에 '=='연산자를 이용해서 true/false를 처리할 수 있다.
	}

	@Transactional
	@Override
	public boolean remove(Long bno) {
		
		log.info("remove.........." + bno);
		
		attachMapper.deleteAll(bno); //첨부파일 삭제와 식제 게시물의 삭제가 같이 처리되도록 트랜잭션 하에서 호출
		
		return mapper.delete(bno) == 1; //정상적으로 수정,삭제가 이루어지면 1이라는 값이 반환되기 때문에 '=='연산자를 이용해서 true/false를 처리할 수 있다.
	}
	
	@Override
	public int getTotal(Criteria cri) {
		
		log.info("get total count");
		
		return mapper.getTotalCount(cri);
		
	}

	@Override
	public List<BoardAttachVO> getAttachList(Long bno) {

		log.info("get Attach list by bno" + bno);
		
		return attachMapper.findByBno(bno);
	}
	
	


}
