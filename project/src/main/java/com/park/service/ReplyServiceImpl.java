package com.park.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.park.domain.Criteria;
import com.park.domain.ReplyVO;
import com.park.mapper.ReplyMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReplyServiceImpl implements ReplyService {
	
	@Setter(onMethod_=@Autowired) //ReplyServiceImpl은 ReplyMapper에 의존적인 관계이기 때문에 @Setter를 이용해서 처리
	private ReplyMapper mapper;
	
	@Override
	public int register(ReplyVO vo) {

		log.info("register.........." + vo);
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

	@Override
	public int remove(Long rno) {

		log.info("remove.........." + rno);
		return mapper.delete(rno);
	}

	@Override
	public List<ReplyVO> getList(Criteria cri, Long bno) {

		log.info("get list.........." + bno);
		return mapper.getListPaging(cri, bno);
	}
	
	

}
