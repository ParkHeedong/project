package com.park.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.park.domain.Criteria;
import com.park.domain.ReplyVO;

public interface ReplyMapper {
	
	public int insert(ReplyVO vo);
	
	public ReplyVO read(Long rno);
	
	public int delete (Long rno);
	
	public int update (ReplyVO reply);
	
	public List<ReplyVO> getListPaging(@Param("cri") Criteria cri, @Param("bno") Long bno); 
	//MyBaits는 @Param을 이용해서 두 개 이상의 데이터를 파라미터로 전달한다.
	//페이징 처리는 기존과 동일하게 Criteria 이용.
	
	public int getCountByBno(Long bno); //댓글의 페이징 처리를 위해 해당 게시물의 전체 댓글 수를 파악해야 함

}
