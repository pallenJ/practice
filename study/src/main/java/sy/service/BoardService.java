package sy.service;

import java.util.List;

import sy.bean.BoardDto;
import sy.model.BoardDao;

public interface BoardService {

	BoardDao getDao();
	List<BoardDto> paging(int page,int cnum);
	List<BoardDto> paging(int cnum);
	int[] paging(int cnum, int pnum, int page);
}
