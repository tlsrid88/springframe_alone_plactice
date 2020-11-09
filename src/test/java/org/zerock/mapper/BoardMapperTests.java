package org.zerock.mapper;

import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.zerock.domain.BoardVO;
import org.zerock.mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {

	@Setter(onMethod_ = @Autowired)
	private BoardMapper boardMapper;
	
	@Test
	public void testGetList() {
		boardMapper.getList().forEach(board -> log.info(board));
	}
	
//	@Test
//	public void testInsert() {
//		BoardVO board = new BoardVO();
//		board.setTitle("작성글");
//		board.setContent("새로운 컨텐트");
//		board.setWriter("신경선");
//		
//		boardMapper.insert(board);
//
//		// Lombok이 만들어주는 toString()을 이용해서 bno멤버 변수(인스턴스변수)의 값을 알아보기 위함입니다. 
//		log.info(board);
//	}
	
//	@Test
//	public void testInsertSelectKey() {
//		log.info("====================================================================");
//		BoardVO board = new BoardVO();
//		board.setTitle("작성글 select");
//		board.setContent("새로운 컨텐트 select");
//		board.setWriter("신경선 select");
//		
//		boardMapper.insert(board);
//
//		// Lombok이 만들어주는 toString()을 이용해서 bno멤버 변수(인스턴스변수)의 값을 알아보기 위함입니다. 
//		log.info(board);
//	}
	
	@Test
	public void testSelect() {
		BoardVO vo = boardMapper.read(5L);
		log.info("\n 	vo : " + vo);
	}
	
//	@Test
//	public void deldte() {
//		
//		log.info("DELETE COUNT :" + boardMapper.delete(3L));
//	}
	

}
