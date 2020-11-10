package org.zerock.service;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardServiceTests {

	@Setter(onMethod_ = {@Autowired})
	private BoardService service;
	
	@Test
	public void testExist() {
		
		log.info(service);
		assertNotNull(service);
	}
	
	/*@Test
	public void testRegister() {
		
		BoardVO vo = new BoardVO();
		vo.setTitle("새로 작성하는 글");
		vo.setContent("새로 작성하는 컨텐츠");
		vo.setWriter("newbie");
		
		service.register(vo);
		
		log.info("생성된 게시물의 번호 : " + vo.getBno());
	}*/
	
	/*@Test
	public void testGetList() {
		service.getList().forEach(board -> log.info(board));
	}*/
	
	/*@Test
	public void getBoard() {
		
		BoardVO vo = service.get(12L);
		log.info("vo : " + vo);
	}*/
	
//	@Test
//	public void testUpdate() {
//		
//		BoardVO vo = new BoardVO();
//		vo.setBno(5L);
//		vo.setTitle("debug");
//		vo.setContent("이것도 수정됨");
//		vo.setWriter("김희선");
//		
//		int count = service.update(vo);
//		log.info("Upate count : " + count);
//	}
	
	@Test
	public void testGetList() {
		service.getList(new Criteria(3, 10)).forEach(board -> log.info(board));
	}
}