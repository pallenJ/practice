package sy.bean;

import java.sql.ResultSet;
import java.sql.SQLException;

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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getReg() {
		return reg;
	}
	public void setReg(String reg) {
		this.reg = reg;
	}
	
}
