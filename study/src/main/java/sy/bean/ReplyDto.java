package sy.bean;

import java.sql.ResultSet;
import java.sql.SQLException;

import lombok.Data;

@Data
public class ReplyDto {

	int no;
	int board;
	String writer;
	String reg;
	
	int parent;
	int gno;
	boolean secret;
	
	String content;
	public ReplyDto() {}
	public ReplyDto(ResultSet rs) throws SQLException {
		setNo(rs.getInt("no"));
		setBoard(rs.getInt("board"));
		setWriter(rs.getString("writer"));
		setReg(rs.getString("reg"));
	
		setParent(rs.getInt("parent"));
		setGno(rs.getInt("gno"));
		setSecret(rs.getBoolean("secret"));
		setContent(rs.getString("content"));
	}
}
