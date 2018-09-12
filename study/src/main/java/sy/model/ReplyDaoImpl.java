package sy.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import sy.bean.ReplyDto;

@Repository("replyDao")
public class ReplyDaoImpl implements ReplyDao{
    
	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public boolean write(int bno, ReplyDto reply) {
		// TODO Auto-generated method stub
		int no = jdbcTemplate.queryForObject("select reply_seq.NEXTVAL from dual", Integer.class);
		String sql = "insert into s_reply values (?,?,?,sysdate,?,?,?,?)";
		if(reply.getParent()==0) reply.setParent(no);
		Object [] args = {no,bno,reply.getWriter(),reply.getParent(),
				reply.getGno(),reply.isSecret(),reply.getContent()};
		return jdbcTemplate.update(sql,args)>0;
	}
	
	private ResultSetExtractor<ReplyDto> extractor = rs->{return rs.next()?new ReplyDto(rs):null;};
	
	@Override
	public ReplyDto replyDetail(int no) {
		// TODO Auto-generated method stub
		return jdbcTemplate.query("select * from s_reply where no=?",extractor,no);
	}

	
	private RowMapper<ReplyDto> mapper = (rs,idx)->{return new ReplyDto(rs);};
	
	@Override
	public List<ReplyDto> allList() {
		// TODO Auto-generated method stub
		return jdbcTemplate.query("select * from s_reply order by parent desc,gno asc,no desc",mapper);
	}

	
	@Override
	public List<ReplyDto> replyList(int bno) {
		// TODO Auto-generated method stub
		String sql = "select * from (select * from s_reply "
				+ "order by parent desc,gno asc,no desc) "
				+ "where board="+bno;
		return jdbcTemplate.query(sql, mapper);
	}

	@Override
	public List<ReplyDto> myReplyList(String email) {
		// TODO Auto-generated method stub
		String sql = "select * from (select * from s_reply "
				+ "order by parent desc,gno asc,no desc) "
				+ "where writer="+email;
		return jdbcTemplate.query(sql, mapper);
	}



	@Override
	public boolean replyEdit(int no,String content) {
		// TODO Auto-generated method stub
		
		return jdbcTemplate.update("update s_reply set content=? where no = ?",no,content)>0;
	}

	
	@Override
	public boolean replyEdit(ReplyDto reply) {
		// TODO Auto-generated method stub
		return replyEdit(reply.getNo(),reply.getContent());
	}

	@Override
	public boolean replyDelete(int no) {
		// TODO Auto-generated method stub
		ReplyDto reply=replyDetail(no);
		return replyDelete(reply);
	}



	@Override
	public boolean replyDelete(ReplyDto reply) {
		// TODO Auto-generated method stub
		return jdbcTemplate.update("delete s_reply where parent=? and gno>="
				,reply.getParent(),reply.getGno())>0;
	}


	@Override
	public boolean replyNumUpdate(int bno) {
		// TODO Auto-generated method stub
		int rno = replyList(bno).size();
		String sql = "update s_board set rno=? where no=?";
		return jdbcTemplate.update(sql,rno,bno)>0;
	}
	
	
	

}
