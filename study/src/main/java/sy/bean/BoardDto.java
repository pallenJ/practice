package sy.bean;

import java.sql.ResultSet;
import java.sql.SQLException;

import lombok.Data;

@Data
public class BoardDto {
	/*
	 * uploadpath varchar2(256), 
upload varchar2(256), 
uploadname varchar2(256),
	 * */
	private int no;
	private String board;
	private String title;
	private boolean secret;
	private String content;
	
	private String uploadpath;//업로드 경로
	private String upload;    //실제 이름
	private String uploadname;//저장된 이름
	
	private String reg;
	private int read;
	private String writer;
	private int parent;
	private int gno;
	private int rno;

	public BoardDto() {}
	public BoardDto(ResultSet rs) throws SQLException {
		setNo(rs.getInt("no"));
		setBoard(rs.getString("board"));
		setTitle(rs.getString("title"));
		setSecret(rs.getBoolean("secret"));
		setContent(rs.getString("content"));
		
		setReg(rs.getString("reg"));
		setRead(rs.getInt("read"));
		setWriter(rs.getString("writer"));
		setParent(rs.getInt("parent"));
		setGno(rs.getInt("gno"));
		setRno(rs.getInt("rno"));
	}
}
