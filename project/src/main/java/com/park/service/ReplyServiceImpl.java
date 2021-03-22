package com.park.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.park.domain.Criteria;
import com.park.domain.ReplyPageDTO;
import com.park.domain.ReplyVO;
import com.park.mapper.BoardMapper;
import com.park.mapper.ReplyMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReplyServiceImpl implements ReplyService {
	
	@Setter(onMethod_=@Autowired) //ReplyServiceImpl은 ReplyMapper에 의존적인 관계이기 때문에 @Setter를 이용해서 처리
	private ReplyMapper mapper;
	
	@Setter(onMethod_=@Autowired)
	private BoardMapper boardMapper;
	
	@Transactional
	@Override
	public int register(ReplyVO vo) {

		log.info("register.........." + vo);
		
		boardMapper.updateReplyCnt(vo.getBno(),1);
		
		return mapper.insert(vo);
	}

	@Override
	public ReplyVO get(Long rno) {
		
		log.info("get.........." + rno);
		return mapper.read(rno);
	}

	@Override
	public int modify(ReplyVO vo) {

		log.info("modify.........." + vo);
		return mapper.update(vo);
	}

	@Transactional
	@Override
	public int remove(Long rno) {

		log.info("remove.........." + rno);
		
		ReplyVO vo = mapper.read(rno);
		
		boardMapper.updateReplyCnt(vo.getBno(), -1);
		
		return mapper.delete(rno);
	}

	@Override
	public List<ReplyVO> getList(Criteria cri, Long bno) {

		log.info("get list.........." + bno);
		return mapper.getListPaging(cri, bno);
	}
	
	@Override
	public ReplyPageDTO getListPage(Criteria cri, Long bno) {
		
		return new ReplyPageDTO(
				mapper.getCountByBno(bno),
				mapper.getListPaging(cri, bno));
				
	}

}
