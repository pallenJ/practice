package org.zerock.mapper;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardVO;
import org.zerock.service.BoardService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml" })

@Log4j
public class BoardServiceTests {

	@Setter(onMethod_ = {@Autowired})
	private BoardService service;
	
//	@Test
	public void testExist() {
		log.info(service);
		assertNotNull(service);
	}
//	@Test
	public void testRegister() {
		BoardVO vo = new BoardVO();
		vo.setTitle("제목0");
		vo.setContent("내용0");
		vo.setWriter("글쓴이0");
		service.register(vo);
		log.info("bno : "+vo.getBno());
	}
	
//	@Test
	public void testList() {
		service.getList().forEach(vo->log.info(vo));
	}
	
	@Test
	public void testOthers() {
		//log.info(service.get(6L));
		//log.info("REMOVE RS :"+service.remove(4L));
		BoardVO vo = service.get(6L);
		if(vo==null) return;
		vo.setTitle("제목수정");
		service.modify(vo);
	}
	
	
}
