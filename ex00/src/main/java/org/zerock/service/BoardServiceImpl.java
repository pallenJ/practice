package org.zerock.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.BoardVO;
import org.zerock.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
@Log4j
@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService{
	
	//Logger log = LoggerFactory.getLogger(getClass());
	
	@Setter(onMethod_ =@Autowired)
	private BoardMapper mapper;
	
	@Override
	public void register(BoardVO vo) {
		log.info("register..........................."+vo);
		mapper.insert(vo);
	}

	@Override
	public BoardVO get(Long bno) {
		log.info("get...........................");
		return mapper.read(bno);
	}

	@Override
	public boolean modify(BoardVO vo) {
		// TODO Auto-generated method stub
		log.info("get..........................."+vo);
		return mapper.update(vo)>0;
	}

	@Override
	public boolean remove(Long bno) {
		// TODO Auto-generated method stub
		return mapper.delete(bno)>0;
	}

	@Override
	public List<BoardVO> getList() {
		log.info("get List...........................");
		// TODO Auto-generated method stub
		return mapper.getList();
	}
	
	
	
}
