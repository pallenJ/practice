package sy.bean;

import java.sql.ResultSet;
import java.sql.SQLException;

import lombok.Data;

@Data
public class MemberDto {

	private String email;
	private String name;
	private String pw;
	private String grade;
	private String reg;
	
	public MemberDto(ResultSet rs) throws SQLException {
		setEmail(rs.getString("email"));
		setName(rs.getString("name"));
		setPw(rs.getString("pw"));
		setGrade(rs.getString("grade"));
		setReg(rs.getString("reg"));
		
		}
	public MemberDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
