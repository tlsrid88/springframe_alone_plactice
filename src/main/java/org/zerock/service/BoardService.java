package org.zerock.service;

import java.util.List;

import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

public interface BoardService {

	public void register(BoardVO board);
	
	public BoardVO get(Long bno);
	
	public boolean modify(BoardVO boadr);
	
	public boolean remove(Long bno);
	
	public int update(BoardVO vo);

	public List<BoardVO> getList(Criteria cri);
	
}
