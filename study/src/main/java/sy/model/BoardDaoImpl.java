package sy.model;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import sy.bean.BoardDto;

@Repository("boardDao")
public class BoardDaoImpl implements BoardDao{

	private Logger log = LoggerFactory.getLogger(getClass());
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public boolean register(BoardDto board) {
		// TODO Auto-generated method stub
		int no = jdbcTemplate.queryForObject("select board_seq.NEXTVAL from dual", Integer.class);
	
		Object[] args= {no,board.getBoard(),board.getTitle(),String.valueOf(board.isSecret()),board.getContent(),
						   board.getUploadpath(),board.getUpload(),board.getUploadname(),
						   board.getWriter(),no
		};
		return jdbcTemplate.update("insert into s_board values(?,?,?,?,?,?,?,?,sysdate,0,?,?,0)", args)>0;
	}

	private RowMapper<BoardDto>mapper = (rs,idx)->{return new BoardDto(rs);};
	
	@Override
	public List<BoardDto> boardlist() {
		// TODO Auto-generated method stub
		return jdbcTemplate.query("select * from s_board order by parent desc, gno asc, no asc", mapper);
	}
	
	private ResultSetExtractor<BoardDto> extractor = rs -> {return rs.next()?new BoardDto(rs):null;};

	@Override
	public BoardDto boarddetail(int no) {
		// TODO Auto-generated method stub
		return jdbcTemplate.query("select * from s_board where no = ?", extractor, no);
	}
	
	@Override
	public List<BoardDto> boardSearch(String search, String keyword) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public boolean boardEdit(BoardDto board) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean boarddelete(int no) {
		// TODO Auto-generated method stub
		return jdbcTemplate.update("delete s_board where "+(boarddetail(no).getGno()>0?"no":"parent")+"=?",no)>0;
	}

	@Override
	public BoardDto readPlus(BoardDto board) {
		// TODO Auto-generated method stub
		return null;
	}

}
