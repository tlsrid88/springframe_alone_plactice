package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

@Mapper
public interface BoardMapper {

	//@Select("select * from tbl_board where bno > 0")
	//public List<BoardVO> getList();
	
	public List<BoardVO> getList();
	
	public int update(BoardVO board);
	
	public void insertSelectKey(BoardVO board);
	
	public BoardVO read(Long bno);
	
	public int delete(Long bno);

	public List<BoardVO> getListWithPaging(Criteria cri);
	
}
