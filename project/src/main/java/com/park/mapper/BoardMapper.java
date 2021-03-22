package com.park.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.park.domain.BoardVO;
import com.park.domain.Criteria;

public interface BoardMapper {

	//@Select("select * from tbl_board where bno > 0") BoardMapper.xml에서 sql문에 처리 되었으니 주석처리.
	public List<BoardVO> getList();
	
	public List<BoardVO> getListPaging(Criteria cri);
	
	public void insert(BoardVO board);
	
	public void insertSelectKey(BoardVO board); // PK 값을 알아야 하는 경우에 사용
	
	public BoardVO read(Long bno); //insert된 데이터 조회는 pk를 이용해서 처리하므로 BoardMapper의 파라미터 역시 BoardVO 클래스의 bno 타입 정보를 이용해서 처리.
	
	public int delete(Long bno);
	
	public int update(BoardVO board);
	
	public int getTotalCount(Criteria cri);
	
	public void updateReplyCnt(@Param("bno") Long bno, @Param("amount") int amount); //게시물의 번호와 증가나 감소를 의미하는 amount
}
