package org.zerock.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardVO;
import org.zerock.persistence.JDBCTest;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml" })

@Log4j
public class BoardMapperTests {

	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	//@Test
	public void testGetList() {
		mapper.getList().forEach(board-> log.info(board));
	}
	//@Test
	public void testInsert() {
		BoardVO vo = new BoardVO();
		vo.setWriter("글쓴이");
		vo.setTitle("제목");
		vo.setContent("내용");
		mapper.insert(vo);
		mapper.getList().forEach(board->log.info(board));
	}
	//@Test
	public void testDelete() {
	log.info("DEL CNT:"+mapper.delete(2L));
	}
	//@Test
	public void testRead() {
		BoardVO vo = mapper.read(2L);
		log.info(vo);
	}
	@Test
	public void testUpdate() {
		BoardVO vo = new BoardVO();
		vo.setBno(3L);
		vo.setTitle("수정");
		vo.setContent("수정");
		vo.setWriter("수정");
		int count = mapper.update(vo);
		log.info("upd cnt : "+count);
	}
	
}
