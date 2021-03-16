package com.park.mapper;

import java.util.List;
import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.park.domain.Criteria;
import com.park.domain.ReplyVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyMapperTest {
	
	private Long[] bnoArr = {86062L, 86061L, 86060L, 86059L, 86058L};
	
	@Setter(onMethod_= @Autowired)
	private ReplyMapper mapper;
	
	@Test
	public void testMapper() {
		log.info(mapper);
	}

	@Test
	public void testCreate() {
		
		IntStream.rangeClosed(1, 10).forEach(i ->{
			
			ReplyVO vo = new ReplyVO();
			
			vo.setBno(bnoArr[i%5]);
			vo.setReply("댓글 테스트" + i);
			vo.setReplyer("replyer" + i);
			
			mapper.insert(vo);
		});
		
	}
	
	@Test
	public void testRead() {
		
		Long readRno = 10L;
		
		ReplyVO vo = mapper.read(readRno);
		
		log.info(vo);
	}
	
	@Test
	public void testDelete() {
		Long deleteRno = 1L;
		
		mapper.delete(deleteRno);
	}
	
	@Test
	public void testUpdate() {
		
		Long updateRno = 9L;
		
		ReplyVO vo = mapper.read(updateRno);
		
		vo.setReply("Update Reply : ");
		
		int count = mapper.update(vo);
		
		log.info("UPDATE COUNT : " + count );
	}
	
	@Test
	public void testList() {
		
		Criteria cri = new Criteria();
		
		List<ReplyVO> replies = mapper.getListPaging(cri, bnoArr[0]);
		
		replies.forEach(reply -> log.info(reply));
	}
}

//ReplyMapper를 사용 가능한지 테스트