package sy.model;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import sy.bean.MemberDto;

@Repository("memberDao")
public class MemberDaoImpl implements MemberDao{

	private Logger log = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public boolean register(String email, String id, String pw) {
		// TODO Auto-generated method stub
		return jdbcTemplate.update("insert into s_member values(?,?,?,"
				+ "'normal',sysdate)",email,id,pw)>0;
	}

	@Override
	public boolean register(MemberDto mem) {
		// TODO Auto-generated method stub
		return register(mem.getEmail(),mem.getName(),mem.getPw());
	}

	private ResultSetExtractor<MemberDto> extractor = rs->{
		return rs.next()?new MemberDto(rs):null;
	};
	
	@Override
	public boolean login(String email, String pw) {
		// TODO Auto-generated method stub
		return jdbcTemplate.query(
		"select * from s_member where email=? and pw=?", extractor,email,pw)!=null;
	}

	@Override
	public boolean login(MemberDto mem) {
		// TODO Auto-generated method stub
		return login(mem.getEmail(),mem.getPw());
	}

	@Override
	public MemberDto myInfo(String email) {
		// TODO Auto-generated method stub
		return jdbcTemplate.query("select * from s_member where email=?", extractor,email);
	}

	@Override
	public boolean delete(String email, String pw) {
		// TODO Auto-generated method stub
		return jdbcTemplate.update("delete s_member where email=?,pw=?", email,pw)>0;
	}

	@Override
	public boolean delete(MemberDto mem) {
		// TODO Auto-generated method stub
		return delete(mem.getEmail(),mem.getPw());
	}

	private RowMapper<MemberDto> mapper = (rs,idx)->{
		return new MemberDto(rs);
	};
	@Override
	public List<MemberDto> list() {
		// TODO Auto-generated method stub
		return jdbcTemplate.query("select * from s_member", mapper);
	}
	
	@Override
	public boolean overlapCheck(String email) {
		// TODO Auto-generated method stub
		return select("email", email).size()==0;
	}

	@Override
	public List<MemberDto> select(String col,String keyword) {
		// TODO Auto-generated method stub
		return jdbcTemplate.query("select * from s_member where "+col+"=?", mapper,keyword);
	}

	@Override 
	public Set<String> emailList() {
		// TODO Auto-generated method stub
		return new HashSet<String>(jdbcTemplate.query("select * from s_member",
				(rs,idx)->{return rs.getString("email");}));
	}

	@Override
	public Map<String, MemberDto> nameList() {
		// TODO Auto-generated method stub
		Map<String, MemberDto> list = new HashMap<>();
		for (String email : emailList()) {
			list.put(email, myInfo(email));
		}
		return list;
	}
	
	
}
