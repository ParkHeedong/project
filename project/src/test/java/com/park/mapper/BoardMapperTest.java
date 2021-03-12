package com.park.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.park.domain.BoardVO;
import com.park.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import oracle.net.ano.Service;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTest {

	@Setter(onMethod_ =@Autowired)
	private BoardMapper mapper;
	
	@Test
	public void testGetList() {
		mapper.getList().forEach(board -> log.info(board));
	}
	
	@Test
	public void testInsert() {
		
		BoardVO board = new BoardVO();
		board.setTitle("새로운 글");
		board.setContent("새로운 글 내용");
		board.setWriter("tester");
		
		mapper.insert(board);
		
		log.info(board);
		
	}
	
	@Test
	public void testInsertSelectKey() {
		
		BoardVO board = new BoardVO();
		board.setTitle("새로운 글 select key");
		board.setContent("새로운 글 내용 select key");
		board.setWriter("tester");
		
		mapper.insertSelectKey(board);
		
		log.info(board);
		
	}
	
	@Test
	public void testRead() {
		
		BoardVO board = mapper.read(1L);
		
		log.info(board);
	}
	
	@Test
	public void testDelete() {
		log.info("DELETE COUNT : " + mapper.delete(1L));
	}
	
	@Test
	public void testUpdate() {
		
		BoardVO board = new BoardVO();
		
		board.setBno(2L);
		board.setTitle("updated title");
		board.setContent("updated content");
		board.setWriter("stranger");
		
		int count = mapper.update(board);
		log.info("UPDATE COUNT : " + count);
	}
	
	@Test
	public void testPaing() { //페이징 테스트 완료 (2페이지의 내용이 정상적으로 나옴)
		
		Criteria cri = new Criteria();
		
		cri.setPageNum(3); //setter를 이용해서 1,2,3을 넣어보며 해당 페이지가 나오는지 확인.(완료)
		cri.setAmount(10);
		
		List<BoardVO> list = mapper.getListPaging(cri);
		
		list.forEach(board -> log.info(board));
	}

}
