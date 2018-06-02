package sy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sy.bean.BoardDto;
import sy.model.BoardDao;
@Service("boardService")
public class BoardServiceImpl implements BoardService{

	@Autowired
	BoardDao boardDao;
	
	@Override
	public BoardDao getDao() {
		// TODO Auto-generated method stub
		return boardDao;
	}

	@Override
	public List<BoardDto> paging(int page, int cnum) {
		// TODO Auto-generated method stub
		List<BoardDto> list = boardDao.boardlist();
		return list.subList(10 * (page - 1), Math.min(10 * page, list.size()));
	}

	@Override
	public List<BoardDto> paging(int cnum) {
		// TODO Auto-generated method stub
		return paging(1,cnum);
	}

	@Override
	public int[] paging(int cnum, int pnum, int page) {
		// TODO Auto-generated method stub
		int allCount = boardDao.boardlist().size();
		int last = allCount / cnum + (allCount % cnum == 0 ? 0 : 1);
		if (page > last)
			page = last;
		int pagingNum = pnum * ((page - 1) / pnum);
		int pageLast = last - pagingNum >= pnum ? pnum : last % pnum;
		return new int[] { pagingNum, pageLast, last, page };
	}
	
}
